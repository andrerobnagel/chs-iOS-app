//
//  StaffStore.m
//  RebelNet
//

#import "StaffStore.h"
#import "Staff.h"

@interface StaffStore()

@property (nonatomic, copy) NSMutableArray *privateStaffArray;

@end



@implementation StaffStore

+ (instancetype) sharedStore {
	static StaffStore *sharedStore = nil;
	
	
	//Make sure only one instance is created
	static dispatch_once_t onceToken;
	
	dispatch_once(&onceToken, ^{
		sharedStore = [[self alloc] initPrivate];
	});
	
	
	return sharedStore;
}


- (instancetype) init {
	@throw [NSException exceptionWithName: @"Singelton" reason: @"Use +[StaffStore sharedStore]" userInfo: nil];
	return nil;
}


- (instancetype) initPrivate {
	self = [super init];
	
	if (self) {
		NSString *path = [self itemArchivePath];
		
		_privateStaffArray = [NSKeyedUnarchiver unarchiveObjectWithFile: path];
		
		//If the array hadn't been saved previously, create a new one, and fill it with blank periods
		if (!_privateStaffArray) {
			_privateStaffArray = [NSMutableArray new];
		}
	}
	
	return self;
}


#pragma mark - Adding and retrieving staff


- (void) addStaffMember: (NSString *) fName
				  lName: (NSString *) lName
				  phone: (NSString *) phone
				  email: (NSString *) email
				subject: (NSString *) subject
		  websiteString: (NSString *) website {

	Staff *newStaffMember = [[Staff alloc] initWithfName: fName
												   lName: lName
												   phone: phone
												   email: email
												 subject: subject
										   websiteString: website
					   ];
	
	[_privateStaffArray addObject: newStaffMember];
}


- (NSArray *) allStaff {
	return _privateStaffArray;
}


- (NSArray *) allStaffUnderSubject: (NSString *) subject {
	NSMutableArray *staffUnderSubject = [NSMutableArray new];
	
	for (Staff *staffMember in _privateStaffArray) {
		if ([staffMember.subject compare: subject] == NSOrderedSame)
			[staffUnderSubject addObject: staffMember];
	}
	
	return staffUnderSubject;
}


#pragma mark - Saving and loading staff


- (NSString *) itemArchivePath {
	NSArray *documentDirectories = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
	
	NSString *documentDirectory = [documentDirectories firstObject];
	
	return [documentDirectory stringByAppendingPathComponent: @"staff.archive"];
}

@end
