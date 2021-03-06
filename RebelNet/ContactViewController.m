//
//  ContactViewController.m
//  RebelNet
//

#import <MessageUI/MessageUI.h>
#import "ContactViewController.h"

@interface ContactViewController()<MFMailComposeViewControllerDelegate>

//All of the UILabel declarations are so we can get which one was touched, and call the appropriate number
@property (strong, nonatomic) IBOutlet UIView *mainView;
@property (weak, nonatomic) IBOutlet UILabel *addressLabel;
@property (weak, nonatomic) IBOutlet UILabel *addressLabel2;
@property (weak, nonatomic) IBOutlet UILabel *emailLabel;
@property (weak, nonatomic) IBOutlet UILabel *mainOfficeNumberLabel;
@property (weak, nonatomic) IBOutlet UILabel *attendanceOfficeNumberLabel;
@property (weak, nonatomic) IBOutlet UILabel *athleticOfficeNumberLabel;
@property (weak, nonatomic) IBOutlet UILabel *counselingOfficeNumberLabel;
@property (weak, nonatomic) IBOutlet UILabel *financialOfficeNumberLabel;

@end



@implementation ContactViewController

#pragma mark - Touch events


- (void) touchesBegan: (NSSet *) touches withEvent: (UIEvent *) event {
	//Since we have many lines calling CGRectContainsPoint, just make a variable up here with the value so we don't have to repeat this line
	CGPoint touchPoint = [[[event allTouches] anyObject] locationInView: _mainView];
	
	//TODO: Test this out on a phone. Nothing happens in the simulator.
	
	//Since everything is a label, we check if the touched point is in the frame of each label and then decide what to do
	if (CGRectContainsPoint(_addressLabel.frame, touchPoint) || CGRectContainsPoint(_addressLabel2.frame, touchPoint))
		//Open up the address in Google Maps in the default web browser
		[[UIApplication sharedApplication] openURL: [NSURL URLWithString: @"https://www.google.com/maps/place/Columbine+High+School/@39.603839,-105.074107,17z/data=!3m1!4b1!4m2!3m1!1s0x876b7e54994696c9:0xbc76791a6becf6b7"]];
	else if (CGRectContainsPoint(_emailLabel.frame, touchPoint)) {
		NSArray *toRecipents = @[@"chsrebel@jeffco.k12.co.us"];
	
		MFMailComposeViewController *mc = [MFMailComposeViewController new];
		mc.mailComposeDelegate = self;
		[mc setToRecipients: toRecipents];
		
		[self presentViewController: mc animated: YES completion: nil];
	} else if (CGRectContainsPoint(_mainOfficeNumberLabel.frame, touchPoint))
		[[UIApplication sharedApplication] openURL: [NSURL URLWithString: @"tel:3039824400"]];

	else if (CGRectContainsPoint(_attendanceOfficeNumberLabel.frame, touchPoint))
		[[UIApplication sharedApplication] openURL: [NSURL URLWithString: @"tel:3039824410"]];

	else if (CGRectContainsPoint(_athleticOfficeNumberLabel.frame, touchPoint))
		[[UIApplication sharedApplication] openURL: [NSURL URLWithString: @"tel:3039824399"]];

	else if (CGRectContainsPoint(_counselingOfficeNumberLabel.frame, touchPoint))
		[[UIApplication sharedApplication] openURL: [NSURL URLWithString: @"tel:3039824418"]];

	else if (CGRectContainsPoint(_financialOfficeNumberLabel.frame, touchPoint))
		[[UIApplication sharedApplication] openURL: [NSURL URLWithString: @"tel:3039824433"]];
}


#pragma mark -


- (void) mailComposeController: (MFMailComposeViewController *) controller
		   didFinishWithResult: (MFMailComposeResult) result
						 error: (NSError *) error {

	//Just close the mail interface
	[self dismissViewControllerAnimated: YES completion: NULL];
}

@end
