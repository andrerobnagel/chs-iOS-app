//
//  Staff.h
//  RebelNet
//

#import <Foundation/Foundation.h>
#import "Constants.h"

@interface Staff: NSObject <NSCoding>

@property (nonatomic) NSString *fName, *lName, *subject, *email, *phone;
@property (nonatomic) NSURL *website;


+ (NSArray *) subjects;

- (instancetype) initWithfName: (NSString *) fName
						 lName: (NSString *) lName
						 phone: (NSString *) phone
						 email: (NSString *) email
					   subject: (NSString *) subject
				 websiteString: (NSString *) website;

@end
