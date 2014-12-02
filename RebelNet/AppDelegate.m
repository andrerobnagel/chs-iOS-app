//
//  AppDelegate.m
//  RebelNet
//

#import "AppDelegate.h"
#import "TFHpple.h"
#import "StaffStore.h"
#import "Staff.h"

@interface AppDelegate()

@end



@implementation AppDelegate


- (BOOL) application: (UIApplication *) application didFinishLaunchingWithOptions: (NSDictionary *) launchOptions {
	//Get the PLIST file with the meta data about the data that we cache on the user's device (staff list, calendars)
	NSString *metaValsPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject];
	
	NSString *listPath = [metaValsPath stringByAppendingPathComponent: @"cachedDataMetaValues.plist"];

	//If we haven't done so already, we copy the PLIST from the bundle directory into the documents directory
	if (![[NSFileManager defaultManager] fileExistsAtPath: listPath]) {
		[[NSFileManager defaultManager] copyItemAtPath: [[NSBundle mainBundle] pathForResource: @"cachedDataMetaValues"
																						ofType: @"plist"
														 ]
												toPath: listPath
												 error: nil
		];
	}
	
	//Make it mutable, because we may be updating some values
	NSMutableDictionary *cachedMetaVals = [NSMutableDictionary dictionaryWithContentsOfFile: listPath];

	
	NSDate *currentDate = [NSDate date];
	NSDateComponents *currentDateComponent = [[NSCalendar currentCalendar]
											  components: NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitYear
												fromDate: currentDate
											  ];
	
	NSDate *lastStaffDownloadDate = [cachedMetaVals objectForKey: @"Last staff directory download time"];
	NSDateComponents *staffDateComponent = [[NSCalendar currentCalendar]
											components: NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitYear
												fromDate: lastStaffDownloadDate
											];
	
	
	/*
	 How we determine if the staff directory should be redownloaded

	 ~If the directory is older than six months
	 ~Currently after Jan 1, before redownload month, and the last download date isn't in this year
	 ~Currently after redownload month/day x, and the last download date is before redownload month
	 */

	//Check if there has been six months worth of seconds between now and last download date
	bool shouldRedownloadStaffDir = [currentDate timeIntervalSinceDate: lastStaffDownloadDate] > 15552000;

	//Instead of combining everything into one giant, unreadable mess, separate checks into groups
	if (shouldRedownloadStaffDir == false)
		//It's false, but there's a possibility it could be true. Check the other condition
		shouldRedownloadStaffDir = [currentDateComponent month] < STAFF_REDOWNLOAD_MONTH
									&& [staffDateComponent year] != [currentDateComponent year];
	
	if (shouldRedownloadStaffDir == false)
		shouldRedownloadStaffDir = [currentDateComponent month] > STAFF_REDOWNLOAD_MONTH
									&& [currentDateComponent day] > STAFF_REDOWNLOAD_DAY
									&& [staffDateComponent month] < STAFF_REDOWNLOAD_MONTH;
	

	//If the staff file doesn't exist, it needs to be downloaded, no matter what
	NSString *cachePath = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES)
						   objectAtIndex: 0
						   ];
	
	BOOL staffFileExists = [[NSFileManager defaultManager]
							fileExistsAtPath: [cachePath stringByAppendingPathComponent: @"staff.archive"]
							];
	
	if (!staffFileExists || shouldRedownloadStaffDir) {
		NSData *staffHtmlData = [NSData dataWithContentsOfURL: [NSURL URLWithString: @"https://sites.google.com/a/jeffcoschools.us/chs-homepage/chs-information/FacultyStaff-Directory"]];

		TFHpple *staffParser = [TFHpple hppleWithHTMLData: staffHtmlData];
		
		NSArray *staffNodes = [staffParser searchWithXPathQuery:
							   @"//table[@class='sites-table goog-ws-list-table']/tbody/tr"
							   ];
		

		for (TFHppleElement *element in staffNodes) {
			NSArray *tableRows = [element children];

			//The row is just a filler row. We don't want to add it to the staff list
			if (TRIM([tableRows[0] text]) == nil)
				continue;


			//If the teacher does not teach any of the subjects, they just go in the "other" category.
			NSString *subject;
			
			if ([[Staff subjects] containsObject: TRIM([tableRows[4] text])])
				subject = TRIM([tableRows[4] text]);
			else
				subject = @"Other";

			//Since the tr with the website has an anchor as the child, we need to get the actual web address from the href attribute of the anchor
			NSString *website = [[tableRows[5] firstChild] objectForKey: @"href"];

			//We can just pass the trimmed results straight in because they'll just be empty strings if there was nothing in that column
			[[StaffStore sharedStore] addStaffMember: TRIM([tableRows[0] text])
											   lName: TRIM([tableRows[1] text])
											   phone: TRIM([tableRows[2] text])
											   email: TRIM([tableRows[3] text])
											 subject: subject
									   websiteString: website
			];
		}

		[[StaffStore sharedStore] saveStaffList];
		
		//Update the last time the staff directory was downloaded to now
		[cachedMetaVals setObject: currentDate forKey: @"Last staff directory download time"];
		[cachedMetaVals writeToFile: listPath atomically: SURE];
	}
	
	return YES;
}



- (void) applicationWillResignActive: (UIApplication *) application {
	
}



- (void) applicationDidEnterBackground: (UIApplication *) application {
	
}



- (void) applicationWillEnterForeground: (UIApplication *) application {
	
}



- (void) applicationDidBecomeActive: (UIApplication *) application {
	
}



- (void) applicationWillTerminate: (UIApplication *) application {
}

@end
