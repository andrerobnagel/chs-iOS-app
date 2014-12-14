//
//  StaffViewController.m
//  RebelNet
//

#import "StaffViewController.h"
#import "TeacherInfoViewController.h"
#import "StaffStore.h"
#import "Staff.h"

@interface StaffViewController()

//Contains the search string the user has entered, so it can be passed into the staff Store's staff retrieval methods
@property NSString *currentSearchString;

//When a teacher is selected, these store the section and row that were selected
@property NSInteger selectedTableSection, selectedTableRow;

@end



@implementation StaffViewController

- (void) viewDidLoad {
    [super viewDidLoad];
	
	[self setTitle: @"Staff Directory"];
	
	_currentSearchString = @"";
}


#pragma mark - Table view data source


- (UITableViewCell *) tableView: (UITableView *) tableView cellForRowAtIndexPath: (NSIndexPath *) indexPath {
	static NSString *cellID = @"UITableViewCell";
	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier: cellID];

	//This is necessary for the search bar. Without it, an exception is thrown when the bar is tapped.
	if (cell == nil)
		cell = [[UITableViewCell alloc] initWithStyle: UITableViewCellStyleDefault reuseIdentifier: cellID];
	
	NSArray *teachers = [[StaffStore sharedStore] allStaffUnderSubject: [Staff subjects][indexPath.section] withName: _currentSearchString];
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
	return [[[StaffStore sharedStore] allStaffUnderSubject: [Staff subjects][section] withName: _currentSearchString] count];
}


- (NSString *) tableView: (UITableView *) tableView titleForHeaderInSection: (NSInteger) section {
	return [Staff subjects][section];
}


//Keep track of the table row and section that were selected so we can get the teacher information in the prepareForSegue method
- (NSIndexPath *) tableView: (UITableView *) tableView willSelectRowAtIndexPath: (NSIndexPath *) indexPath {
	_selectedTableRow = indexPath.row;
	_selectedTableSection = indexPath.section;
	
	return indexPath;
}


//We need to manually trigger the segeu when a cell is selected while searching, since it can't have one hooked up in the storyboard. Only do it if we're in the table view, else it will put two views on the stack.
- (void) tableView: (UITableView *) tableView didSelectRowAtIndexPath: (NSIndexPath *) indexPath {
	if (tableView == self.searchDisplayController.searchResultsTableView)
		[self performSegueWithIdentifier: @"ShowTeacherInfo" sender: self];
}


#pragma mark - Search bar methods


- (BOOL) searchDisplayController: (UISearchDisplayController *) controller
shouldReloadTableForSearchString: (NSString *) searchString {
	_currentSearchString = searchString;
	
	return YES;
}


//The current search string isn't automatically erased when the user clicks cancel
- (void) searchBarCancelButtonClicked: (UISearchBar *) searchBar {
	_currentSearchString = @"";
}


#pragma mark - Actions


- (void) prepareForSegue: (UIStoryboardSegue *) segue sender: (id) sender {
	if ([@"ShowTeacherInfo" compare: [segue identifier]] == NSOrderedSame) {
		TeacherInfoViewController *moreTeacherInfo = (TeacherInfoViewController *)[segue destinationViewController];

		//_selectedTableSection and _selectedTableRow variables are always set in the willSelectRow... method
		NSArray *teachers = [[StaffStore sharedStore] allStaffUnderSubject: [Staff subjects][_selectedTableSection] withName: _currentSearchString];
		Staff *teacher = teachers[_selectedTableRow];

		moreTeacherInfo.staff = teacher;

		//We must reset the currentSearchString or crazy things will happen. Also reset the text in the search bar, because when the user goes back, it will be kind of weird having everything displayed when there's text in the search bar.
		//TODO : Someone else change this so when we return, all of the search results are still displayed, and when the cancel button is pressed, everything returns to normal. What we have currently is acceptable though.
		self.searchDisplayController.searchBar.text = @"";
		_currentSearchString = @"";
	}
}

@end
