//
//  BlockViewController.m
//  RebelNet
//

#import "BlockViewController.h"
#import "HourlyScheduleViewController.h"

@interface BlockViewController()

@end



@implementation BlockViewController

- (void) viewDidLoad {
    [super viewDidLoad];
	
	[self.tabBarController setTitle: @"Block schedule"];
	
	UIBarButtonItem *rightButton = [[UIBarButtonItem alloc] initWithTitle: @"Block info"
																	style: UIBarButtonItemStylePlain
																   target: self
																   action: @selector(displayBlockScheduleInfo:)
									];
	self.tabBarController.navigationItem.rightBarButtonItem = rightButton;
	
	NSURLRequest *request = [NSURLRequest requestWithURL: [NSURL URLWithString: @"https://www.google.com/calendar/embed?src=jeffcoschools.us_o6jb8rks9qc0qlhavhmkhrn77o%40group.calendar.google.com&ctz=America/Denver"]];
	[_blockScheduleWebView loadRequest: request];
}


- (void) displayBlockScheduleInfo: (id) sender {
	//ItemsViewController is responsible for pushing the next view controller onto the stack, because it is in the navigationController's stack.
	HourlyScheduleViewController *hourlyViewController = [HourlyScheduleViewController new];

	
	[self.navigationController pushViewController: hourlyViewController animated: YES];
}


@end
