//
//  StaffViewController.m
//  RebelNet
//

#import "StaffViewController.h"
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
	cell.detailTextLabel.text = [Staff subjects][indexPath.section];
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


- (void) tableView: (UITableView *) tableView didSelectRowAtIndexPath: (NSIndexPath *) indexPath {
	
}

@end
