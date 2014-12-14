//
//  TeacherInfoViewController.m
//  RebelNet
//

#import <MessageUI/MessageUI.h>
#import "TeacherInfoViewController.h"

@interface TeacherInfoViewController()<MFMailComposeViewControllerDelegate>

@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *subjectLabel;
@property (weak, nonatomic) IBOutlet UILabel *emailLabel;
@property (weak, nonatomic) IBOutlet UILabel *phoneLabel;
@property (weak, nonatomic) IBOutlet UILabel *websiteLabel;

@end



@implementation TeacherInfoViewController

#pragma mark - View life cycle


- (void) viewWillAppear: (BOOL) animated {
    [super viewWillAppear: animated];
	
	[self setTitle: @"Teacher info"];

	NSDictionary *underlineAttribute = @{NSUnderlineStyleAttributeName: @(NSUnderlineStyleSingle)};
	
	//All staff have a name, subject, and email
	_nameLabel.text = [NSString stringWithFormat: @"%@ %@", _staff.fName, _staff.lName];
	_subjectLabel.text = [NSString stringWithFormat: @"Subject: %@", _staff.subject];
	_emailLabel.attributedText = [[NSAttributedString alloc] initWithString:
								  [NSString stringWithFormat: @"Email: %@", _staff.email]
																 attributes: underlineAttribute
								  ];
	

	//Some staff members may not have phone numbers or websites. If they don't have one, display a message saying "No x".
	//I would just make the label invisible, but then there will be a giant blank space
	if ([_staff.phone length] > 0)
		_phoneLabel.attributedText = [[NSAttributedString alloc] initWithString:
									  [NSString stringWithFormat: @"Voice mail: %@", _staff.phone]
																	 attributes: underlineAttribute
									  ];
	else
		_phoneLabel.text = @"No voice mail";


	if ([[_staff.website absoluteString] length] > 0)
		_websiteLabel.attributedText = [[NSAttributedString alloc] initWithString:
							  [NSString stringWithFormat: @"Website: %@", [_staff.website absoluteString]]
															 attributes: underlineAttribute];
	else
		_websiteLabel.text = @"No website";
}


#pragma mark - Touch events


- (void) touchesBegan: (NSSet *) touches withEvent: (UIEvent *) event {
	CGPoint touchPoint = [[[event allTouches] anyObject] locationInView: self.view];

	//Also check if they actually have a number/website to call before we try calling it
	if (CGRectContainsPoint(_emailLabel.frame, touchPoint)) {
		//Open up an email view with the staff's email as the recipient
		NSArray *toRecipents = @[_staff.email];
		
		MFMailComposeViewController *mc = [MFMailComposeViewController new];
		mc.mailComposeDelegate = self;
		[mc setToRecipients: toRecipents];
		
		[self presentViewController: mc animated: YES completion: nil];
	
	} else if (CGRectContainsPoint(_phoneLabel.frame, touchPoint) && [_staff.phone length] > 0) {
		NSString *nsurlPhoneString = [NSString stringWithFormat: @"tel:%@", _staff.phone];

		[[UIApplication sharedApplication] openURL: [NSURL URLWithString: nsurlPhoneString]];

	} else if (CGRectContainsPoint(_websiteLabel.frame, touchPoint) && [[_staff.website absoluteString] length] > 0) {
		[[UIApplication sharedApplication] openURL: _staff.website];
	}
}


#pragma mark - 


- (void) mailComposeController: (MFMailComposeViewController *) controller
		   didFinishWithResult: (MFMailComposeResult) result
						 error: (NSError *) error {
	
	//TODO: Test this on an actual device running iOS 8. It only works with iOS 7 in the simulators.
	
	//Just close the mail interface
	[self dismissViewControllerAnimated: YES completion: NULL];
}


@end
