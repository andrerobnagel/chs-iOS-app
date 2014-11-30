//
//  StaffStore.h
//  RebelNet
//

#import <Foundation/Foundation.h>
#import "Constants.h"

@interface StaffStore: NSObject

+ (instancetype) sharedStore;

- (void) addStaffMember: (NSString *) fName
				  lName: (NSString *) lName
				  phone: (NSString *) phone
				  email: (NSString *) email
				subject: (NSString *) subject
		websiteString: (NSString *) website;

- (NSArray *) allStaff;
- (NSArray *) allStaffUnderSubject: (NSString *) subject;

@end
