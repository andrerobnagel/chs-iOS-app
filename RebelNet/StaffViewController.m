//
//  StaffViewController.m
//  RebelNet
//

#import "StaffViewController.h"
#import "TeacherInfoViewController.h"
#import "StaffStore.h"
#import "Staff.h"

@interface StaffViewController()

@end



@implementation StaffViewController

- (void) viewDidLoad {
    [super viewDidLoad];
	
	[self setTitle: @"Staff Directory"];
}


#pragma mark - Table view data source


- (UITableViewCell *) tableView: (UITableView *) tableView cellForRowAtIndexPath: (NSIndexPath *) indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier: @"UITableViewCell" forIndexPath: indexPath];
	
	NSArray *teachers = [[StaffStore sharedStore] allStaffUnderSubject: [Staff subjects][indexPath.section]];
	Staff *teacher = teachers[indexPath.row];
	
	cell.textLabel.text = [NSString stringWithFormat: @"%@ %@", teacher.fName, teacher.lName];
	cell.accessoryType = UITableViewCellAccessoryDetailButton;

    return cell;
}


#pragma mark Table sections


- (NSInteger) numberOfSectionsInTableView: (UITableView *) tableView {
	return [[Staff subjects] count];
}


- (NSInteger) tableView: (UITableView *) tableView numberOfRowsInSection: (NSInteger) section {
	return [[[StaffStore sharedStore] allStaffUnderSubject: [Staff subjects][section]] count];
}


- (NSString *) tableView: (UITableView *) tableView titleForHeaderInSection: (NSInteger) section {
	return [Staff subjects][section];
}


#pragma mark - Actions


- (void) prepareForSegue: (UIStoryboardSegue *) segue sender: (id) sender {
	if ([@"ShowTeacherInfo" compare: [segue identifier]] == NSOrderedSame) {
		TeacherInfoViewController *moreTeacherInfo = (TeacherInfoViewController *)[segue destinationViewController];

		//We need to get the indexPath of the ViewCell that was selected, so we can get the teacher information
		NSIndexPath *selectedIndexPath = [self.tableView indexPathForSelectedRow];

		NSArray *teachers = [[StaffStore sharedStore] allStaffUnderSubject: [Staff subjects][selectedIndexPath.section]];
		Staff *teacher = teachers[selectedIndexPath.row];

		moreTeacherInfo.staff = teacher;
	}
}

@end
