//
//  ScheduleViewController.m
//  RebelNet
//

#import "ScheduleViewController.h"
#import "ScheduleCell.h"
#import "PeriodViewController.h"
#import "PeriodStore.h"

@interface ScheduleViewController()

@property (weak, nonatomic) IBOutlet UITableView *scheduleView;

@end



@implementation ScheduleViewController

#pragma mark - View life cycle

- (void) viewDidLoad {
	[super viewDidLoad];

	//Make sure the height here is the same as the height of the ScheduleCell in the XIB file.
	//This is to prevent a "case constraints amiguously suggest a height of zero" warning
	_scheduleView.rowHeight = 60;

	UINib *nib = [UINib nibWithNibName: @"ScheduleCell" bundle: nil];

	[_scheduleView registerNib: nib forCellReuseIdentifier: @"ScheduleCell"];
}


//Just reload the data every time the table view appears, because if the user updates a period in the periodView screen, we want the table to reflect that.
//TODO: Find a more efficient way of doing this that only updates the tableView when something is changed
- (void) viewDidAppear: (BOOL) animated {
	[_scheduleView reloadData];
}


#pragma mark - Table view data sources


- (NSInteger) tableView: (UITableView *) tableView numberOfRowsInSection: (NSInteger) section {
	return NUM_PERIODS;
}


- (UITableViewCell *) tableView: (UITableView *) tableView cellForRowAtIndexPath: (NSIndexPath *) indexPath {
	ScheduleCell *cell = [tableView dequeueReusableCellWithIdentifier: @"ScheduleCell"
													 forIndexPath: indexPath
					  ];
	
	Period *cellPeriod = [[PeriodStore sharedStore] periodAtIndex: indexPath.row];


	//Color code the table cells and text according to the type of day it is
	if (cellPeriod.periodNumber % 2 == 1) {
		cell.backgroundColor = REBELBLUE(1.0);

		cell.classPeriodLabel.textColor = [UIColor whiteColor];
		cell.classNameLabel.textColor = [UIColor whiteColor];
		cell.classroomLabel.textColor = [UIColor whiteColor];

		//Change the default "selected" color to a lighter blue to prevent ugliness
		UIView *backView = [[UIView alloc] initWithFrame: cell.frame];
		backView.backgroundColor = [UIColor colorWithRed: 0.2549 green: 0.3490 blue: 0.5725 alpha: 1.0];
		cell.selectedBackgroundView = backView;
	} else {
		cell.backgroundColor = REBELSILVER(1.0);
	}
	
	cell.classPeriodLabel.text = [NSString stringWithFormat: @"Period %lu", (unsigned long)cellPeriod.periodNumber];
	cell.classroomLabel.text = cellPeriod.classroom;
	
	cell.classNameLabel.text = cellPeriod.className;

	return cell;
}


#pragma mark - Actions


- (void) tableView: (UITableView *) tableView didSelectRowAtIndexPath: (NSIndexPath *) indexPath {
	PeriodViewController *periodViewController = [PeriodViewController new];

	//Add one because we are setting the period, and the index row is zero-based
	periodViewController.period = [[PeriodStore sharedStore] periodAtIndex: indexPath.row];
	
	[self.navigationController pushViewController: periodViewController animated: YES];
}


//Show a dialog box making sure the user wants to clear their schedule
- (IBAction) clearSchedule: (id) sender {
	UIAlertView *clearScheduleConfirmation = [[UIAlertView alloc] initWithTitle: @"Confirm"
													message: @"Are you sure you want to clear your schedule?"
												   delegate: self
										  cancelButtonTitle: @"No"
										  otherButtonTitles: @"Yes", nil
						];
	[clearScheduleConfirmation show];
}


- (void) alertView: (UIAlertView *) alertView clickedButtonAtIndex: (NSInteger) buttonIndex {
	//Here's where the actual clearing occurs when the user selects "clear"
	if (buttonIndex == 1){
		[[PeriodStore sharedStore] clearSchedule];
		[[PeriodStore sharedStore] saveChanges];
		[_scheduleView reloadData];
	}
}

@end
