//
//  PeriodStore.m
//  RebelNet
//

#import "PeriodStore.h"

@interface PeriodStore()

@property (nonatomic, copy) NSMutableArray *privatePeriods;

@end



@implementation PeriodStore

#pragma mark - Activity life cycle

+ (instancetype) sharedStore {
	static PeriodStore *sharedStore = nil;


	//Make sure only one instance is created
	static dispatch_once_t onceToken;
	
	dispatch_once(&onceToken, ^{
		sharedStore = [[self alloc] initPrivate];
	});
	
	
	return sharedStore;
}


//If someone calls this, tell them that they can't
- (instancetype) init {
	@throw [NSException exceptionWithName: @"Singelton" reason: @"Use +[PeriodStore sharedStore]" userInfo: nil];
	return nil;
}


//This is the real (secret) initializer
- (instancetype) initPrivate {
	self = [super init];

	if (self) {
		NSString *path = [self itemArchivePath];
		
		//This takes the file and unarchives it into an object of the type that was encoded; in this case, an NSMutableArray
		_privatePeriods = [NSKeyedUnarchiver unarchiveObjectWithFile: path];
		
		//If the array hadn't been saved previously, create a new one, and fill it with blank periods
		if (!_privatePeriods) {
			_privatePeriods = [NSMutableArray new];
			
			for (int pd = 1; pd <= NUM_PERIODS; pd++)
				[_privatePeriods addObject: [[Period alloc] initWithPeriod: pd]];
		}
	}

	return self;
}


#pragma mark - Dealing with periods


- (void) editPeriod: (NSUInteger) period newName: (NSString *) name newRoom: (NSString *) room {
	//The period is passed in, and the array holding the periods is zero-based, so we move align the period with the index
	NSUInteger index = period - 1;
	
	//If our index is bad for some reason, do nothing and quietly log the error
	if (index > [_privatePeriods count]) {
		NSLog(@"Error: trying to edit period that does not exist (Period %i)", index);
	} else {
		Period *editingPeriod = _privatePeriods[index];
		editingPeriod.className = name;
		editingPeriod.classroom = room;
	}
}


- (Period *) periodAtIndex: (NSUInteger) index {
	return _privatePeriods[index];
}


//Reset all of the period data to empty
- (void) clearSchedule {
	for (int pd = 0; pd < [_privatePeriods count]; pd++) {
		Period *editingPeriod = _privatePeriods[pd];
		editingPeriod.className = @"";
		editingPeriod.classroom = @"";
	}
}


#pragma mark - Saving and loading Periods


- (NSString *) itemArchivePath {
	//Don't put in Documents/ because it's not worth it to have something this small backed up
	NSArray *documentDirectories = NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES);

	NSString *documentDirectory = [documentDirectories firstObject];

	return [documentDirectory stringByAppendingPathComponent: @"periods.archive"];
}


-(BOOL) saveChanges {
	NSString *path = [self itemArchivePath];
	
	//Return YES on success
	return [NSKeyedArchiver archiveRootObject: self.privatePeriods toFile: path];
}

@end
