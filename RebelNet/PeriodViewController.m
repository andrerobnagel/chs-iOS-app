//
//  PeriodViewController.m
//  RebelNet
//

#import "PeriodViewController.h"
#import "PeriodStore.h"
#import "Period.h"

@interface PeriodViewController()

@property (weak, nonatomic) IBOutlet UILabel *classPeriodLabel;
@property (weak, nonatomic) IBOutlet UITextField *classNameField;
@property (weak, nonatomic) IBOutlet UIPickerView *classPicker;

@end



@implementation PeriodViewController

#pragma mark - View life cycle

- (void) viewWillAppear: (BOOL) animated {
	[super viewWillAppear: animated];
	
	self.title = @"Edit period";

	
	//Hardcode all of the classrooms, because they probably aren't going to change.
	//I would load everything from a text file, but it doesn't provide much of a benefit in code cleanliness, and it hurts speed
	_classrooms = @[
					@"", @"SS-1", @"SS-2", @"SS-3", @"SS-4", @"SS-5", @"SS-6", @"SS-7", @"SS-8", @"SS-9", @"SS-10", @"SS-11",
					@"MA-1", @"MA-2", @"MA-3", @"MA-4", @"MA-5", @"MA-6", @"MA-7", @"MA-8", @"MA-9", @"MA-10", @"MA-11", @"MA-12", @"MA-13",
					@"LA-1", @"LA-2", @"LA-3", @"LA-4", @"LA-5", @"LA-6", @"LA-7", @"LA-8", @"LA-9", @"LA-10", @"LA-11", @"LA-12", @"LA-13",
					@"SCI-1", @"SCI-2", @"SCI-3", @"SCI-4", @"SCI-5", @"SCI-6", @"SCI-7", @"SCI-8", @"SCI-9", @"SCI-10", @"SCI-11", @"SCI-12",
					@"WL-1", @"WL-2", @"WL-3", @"WL-4", @"WL-5", @"WL-6", @"WL-7",
					@"BUS-1", @"BUS-2", @"BUS-3", @"BL-4",
					@"Weight room", @"Gym", @"Drawing", @"Ceramics", @"Art room", @"ACE", @"Wood shop", @"RNN room", @"Publications lab", @"Challenge room", @"SE-1", @"SE-2", @"SE-3",
					@"Main office", @"Attendance office", @"Athletics office", @"Library", @"PostGrad center", @"Counseling office", @"Lecture room", @"Auditorium"
					];

	//Change the color of the period label to reflect the type of day. We don't change it for silver days because it doesn't show up. Black is close to silver, right?
	if (_period.periodNumber % 2 == 1)
		_classPeriodLabel.textColor = REBELBLUE(1.0);
	
	
	_classPeriodLabel.text = [NSString stringWithFormat: @"Period %lu", (unsigned long)_period.periodNumber];
	_classNameField.text = _period.className;

	//If there is a classroom that has been set, set the selected item of the picker to that classroom
	//We do that by finding the position of the classroom in the classrooms array. This position will match up with the position in the picker.
	if ([_period.classroom length] > 0) {
		NSUInteger classroomPos = [_classrooms indexOfObject: _period.classroom];
		[_classPicker selectRow: classroomPos inComponent: 0 animated: NO];
	}
}


#pragma mark - Classroom picker data source


- (NSInteger) numberOfComponentsInPickerView: (UIPickerView *) pickerView {
	return 1;
}


- (NSInteger) pickerView: (UIPickerView *) pickerView numberOfRowsInComponent: (NSInteger) component {
	return [_classrooms count];
}


- (NSString *) pickerView: (UIPickerView *) pickerView titleForRow: (NSInteger) row forComponent: (NSInteger) component {
	return [_classrooms objectAtIndex: row];
}


#pragma mark - Text field handlers

//Limit the max length of the class name because classes won't have excessively long names
- (BOOL) textField: (UITextField *) textField
shouldChangeCharactersInRange: (NSRange) range
 replacementString: (NSString *) string {

	NSUInteger newLength = [textField.text length] + [string length] - range.length;
	return (newLength > 50) ? NO : YES;
}


- (BOOL) textFieldShouldReturn: (UITextField *) textField {
	[textField resignFirstResponder];
	return YES;
}


#pragma mark - Actions


- (IBAction) savePeriod: (id) sender {
	NSInteger selectedClassroomIndex = [_classPicker selectedRowInComponent: 0];

	//If for some reason no selected row is returned, then we will just have no classroom set
	if (selectedClassroomIndex == -1)
		selectedClassroomIndex = 0;


	NSString *className = TRIM(_classNameField.text);
	
	[[PeriodStore sharedStore] editPeriod: _period.periodNumber
								  newName: className
								  newRoom: _classrooms[selectedClassroomIndex]
	];
	
	[[PeriodStore sharedStore] saveChanges];


	//Give the user some indication their schedule has been saved.
	//TODO: This may be annoying. Find a less invasive way of notifying the user. Maybe something like an android toast.
	UIAlertView *scheduleSavedAlert = [[UIAlertView alloc] initWithTitle: @""
													message: @"Your schedule has been updated!"
												   delegate: nil
										  cancelButtonTitle: @"Ok"
										  otherButtonTitles: nil
						  ];
	[scheduleSavedAlert show];
}


- (IBAction) resetPeriod: (id) sender {
	//Wipe both the data in the view and in the model
	_classNameField.text = @"";
	[_classPicker selectRow: 0 inComponent: 0 animated: YES];


	[[PeriodStore sharedStore] editPeriod: _period.periodNumber
								  newName: @""
								  newRoom: @""
	 ];
	
	[[PeriodStore sharedStore] saveChanges];
}

@end
