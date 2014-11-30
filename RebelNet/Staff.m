//
//  Staff.m
//  RebelNet
//

#import "Staff.h"

@implementation Staff

//Make the subjects "public" because they need to be accessed in multiple areas.
//Since this is also data, it's best to have it in the model part of MVC
+ (NSArray *) subjects {
	return @[@"Art", @"DDL", @"English", @"Family Consumer Studies", @"Math", @"Music", @"Physical Education", @"Science", @"Social Studies", @"Wood Shop", @"World Language", @"Other"];
}


#pragma mark - Initializers

//Designated initializer
- (instancetype) initWithfName: (NSString *) fName
						 lName: (NSString *) lName
						 phone: (NSString *) phone
						 email: (NSString *) email
					   subject: (NSString *) subject
				 websiteString: (NSString *) website {
	
	self = [super init];
	
	if (self) {
		_fName = fName;
		_lName = lName;
		_subject = subject;
		_email = email;
		_phone = phone;
		_website = [NSURL URLWithString: website];
	}
	
	return self;
}


- (instancetype) init {
	return [self initWithfName: @"" lName: @"" phone: @"" email: @"" subject: @"" websiteString: @""];
}


- (id) initWithCoder: (NSCoder *) aDecoder {
	self = [super init];
	
	if (self) {
		_fName = [aDecoder decodeObjectForKey: @"fName"];
		_lName = [aDecoder decodeObjectForKey: @"lName"];
		_phone = [aDecoder decodeObjectForKey: @"phone"];
		_email = [aDecoder decodeObjectForKey: @"email"];
		_subject = [aDecoder decodeObjectForKey: @"subject"];
		_website = [aDecoder decodeObjectForKey: @"website"];
	}
	
	return self;
}


#pragma mark - Saving


- (void) encodeWithCoder: (NSCoder *) aCoder {
	[aCoder encodeObject: _fName forKey: @"fName"];
	[aCoder encodeObject: _lName forKey: @"lName"];
	[aCoder encodeObject: _phone forKey: @"phone"];
	[aCoder encodeObject: _email forKey: @"email"];
	[aCoder encodeObject: _subject forKey: @"subject"];
	[aCoder encodeObject: _website forKey: @"website"];
}

@end
