//
//  Period.m
//  RebelNet
//

#import "Period.h"

@implementation Period

#pragma mark - Initializers

//Designated initializer
- (instancetype) initWithPeriod: (NSUInteger) period name: (NSString *) name classroom: (NSString *) classroom {
	self = [super init];
	
	if (self) {
		_periodNumber = period;
		_className = name;
		_classroom = classroom;
	}

	return self;
}


- (instancetype) initWithPeriod: (NSUInteger) period {
	return [self initWithPeriod: period name: @"" classroom: @""];
}


- (instancetype) init {
	return [self initWithPeriod: 1 name: @"" classroom: @""];
}


- (instancetype) initWithCoder: (NSCoder *) aDecoder {
	self = [super init];
	
	if (self) {
		_periodNumber = [aDecoder decodeIntForKey: @"periodNumber"];
		_className = [aDecoder decodeObjectForKey: @"className"];
		_classroom = [aDecoder decodeObjectForKey: @"classroom"];
	}
	
	return self;
}


#pragma mark - Saving

- (void) encodeWithCoder: (NSCoder *) aCoder {
	[aCoder encodeInt: _periodNumber forKey: @"periodNumber"];
	[aCoder encodeObject: _className forKey: @"className"];
	[aCoder encodeObject: _classroom forKey: @"classroom"];
}

@end
