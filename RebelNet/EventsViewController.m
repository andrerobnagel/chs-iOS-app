//
//  EventViewController.m
//  RebelNet
//

#import "EventsViewController.h"

@interface EventsViewController()

@end



@implementation EventsViewController

- (void) viewDidLoad {
	[super viewDidLoad];
	
	[self.tabBarController setTitle: @"Events"];
	
	NSURLRequest *request = [NSURLRequest requestWithURL: [NSURL URLWithString: @"http://www.jeffcok12events.org/g5-bin/client.cgi?cwellOnly=1&G5statusflag=view&schoolname=&school_id=5&G5button=13&G5genie=581&vw_schoolyear=1&vw_agl=4931-1-0,4864-1-0,2656-1-0,7088-1-0,3682-1-0,6942-1-0,4552-1-0,4833-1-0,4832-1-0,4834-1-0,4867-1-0,3068-1-0,1376-1-0,3521-1-0,8306-1-0,5268-1-0,5695-1-0,3858-1-0,5063-1-0,3185-1-0,1375-1-0,3330-1-0,3445-1-0,7640-1-0,6074-1-0,7236-1-0,4042-1-0,3266-1-0,8270-1-0,6793-1-0,7242-1-0,1262-1-0,5496-1-0,3258-1-0,4862-1-0,2850-1-0,4893-1-0,4894-1-0,4895-1-0,7243-1-0,1369-1-0,4892-1-0,2848-1-0,2849-1-0,7027-1-0,4714-1-0,2655-1-0,4869-1-0,5016-1-0,3939-1-0,5863-1-0,7087-1-0,7420-1-0,4863-1-0,5785-1-0,5157-1-0,4615-1-0,4527-1-0,4861-1-0,3342-1-0,&category_sel=0&category="]];
	[_eventsWebView loadRequest: request];
}

@end
