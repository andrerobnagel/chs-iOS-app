//
//  HourlyScheduleViewController.m
//  RebelNet
//

#import "HourlyScheduleViewController.h"
#import "PeriodStore.h"
#import "Period.h"

@interface HourlyScheduleViewController()

@property (weak, nonatomic) IBOutlet UIView *contentView;

@end



@implementation HourlyScheduleViewController

- (void) viewDidLoad {
	[self setTitle: @"Block schedule info"];
	
	//Set the class names and classrooms
	//The UILabel tags go class room, class room, class room, class name, class name, class name.
	
	//First, we need to get the names and classrooms that are saved
	NSArray *periods = [[PeriodStore sharedStore] allPeriods];


	//The tag number we are operating on doesn't necessarily correspond to period number, so we need to keep track of the current period we are getting information from
	unsigned short int currentPeriodNum = 1;

	//This keeps track of the current UILabel tag that we are operating on
	unsigned int viewTag = 1;
	
	//Each time we loop through, we're going to get and store a period. Declare it up here
	Period *currentPeriod;

	//We're also going to store a label
	UILabel *currentLabel;

	//Set the class rooms for blue & silver days
	for (; viewTag <= 8; viewTag++) {
		currentPeriod = periods[currentPeriodNum - 1];

		currentLabel = (UILabel *)[_contentView viewWithTag: viewTag];
		currentLabel.text = currentPeriod.classroom;
		
		currentPeriodNum++;
	}
	
	currentPeriodNum = 1; //Reset the current period.
	
	//Set the class names for blue & silver days
	for (; viewTag <= 16; viewTag++) {
		currentPeriod = periods[currentPeriodNum - 1];
		
		currentLabel = (UILabel *)[_contentView viewWithTag: viewTag];
		currentLabel.text = currentPeriod.className;
		
		currentPeriodNum++;
	}
	
	currentPeriodNum = 1;
	
	//Set the class rooms for rebel days
	for (; viewTag <= 24; viewTag++) {
		currentPeriod = periods[currentPeriodNum - 1];
		
		currentLabel = (UILabel *)[_contentView viewWithTag: viewTag];
		currentLabel.text = currentPeriod.classroom;
		
		currentPeriodNum++;
	}
	
	currentPeriodNum = 1;
	
	//Set the class names for rebel days
	for (; viewTag <= 32; viewTag++) {
		currentPeriod = periods[currentPeriodNum - 1];
		
		currentLabel = (UILabel *)[_contentView viewWithTag: viewTag];
		currentLabel.text = currentPeriod.className;
		
		currentPeriodNum++;
	}
}


@end
