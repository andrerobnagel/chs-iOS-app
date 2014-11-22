//
//  ScheduleViewController.m
//  RebelNet
//
//  Created by Andre on 11/18/14.
//

#import "ScheduleViewController.h"
#import "ScheduleCell.h"
#import "PeriodViewController.h"

#define NUM_PERIODS 8

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


#pragma mark - Table view data sources


- (NSInteger) tableView: (UITableView *) tableView numberOfRowsInSection: (NSInteger) section {
	return NUM_PERIODS;
}


- (UITableViewCell *) tableView: (UITableView *) tableView cellForRowAtIndexPath: (NSIndexPath *) indexPath {
	ScheduleCell *cell = [tableView dequeueReusableCellWithIdentifier: @"ScheduleCell"
													 forIndexPath: indexPath
					  ];
	
	return cell;
}


#pragma mark - Actions

- (void) tableView: (UITableView *) tableView didSelectRowAtIndexPath: (NSIndexPath *) indexPath {
	PeriodViewController *periodViewController = [PeriodViewController new];
	
	[self.navigationController pushViewController: periodViewController animated: YES];
}

@end
