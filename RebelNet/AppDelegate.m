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
	NSData *staffHtmlData = [NSData dataWithContentsOfURL: [NSURL URLWithString: @"https://sites.google.com/a/jeffcoschools.us/chs-homepage/chs-information/FacultyStaff-Directory"]];
	
	TFHpple *staffParser = [TFHpple hppleWithHTMLData: staffHtmlData];
	
	NSArray *staffNodes = [staffParser searchWithXPathQuery: @"//table[@class='sites-table goog-ws-list-table']/tbody/tr"];
	

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


		//We can just put the trimmed results
		[[StaffStore sharedStore] addStaffMember: TRIM([tableRows[0] text])
										   lName: TRIM([tableRows[1] text])
										   phone: TRIM([tableRows[2] text])
										   email: TRIM([tableRows[3] text])
										 subject: subject
								   websiteString: TRIM([tableRows[5] text])
		];
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
