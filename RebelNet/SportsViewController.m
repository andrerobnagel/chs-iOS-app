//
//  SportsViewController.m
//  RebelNet
//

#import "SportsViewController.h"

@interface SportsViewController()

@end



@implementation SportsViewController

- (void)viewDidLoad {
    [super viewDidLoad];

	[self.tabBarController setTitle: @"Sports"];
	
	NSURL *url= [NSURL URLWithString: @"http://www.jeffcok12events.org/g5-bin/client.cgi?cwellOnly=1&G5statusflag=view&schoolname=&school_id=5&G5button=13&G5genie=581&vw_schoolyear=1&vw_agl=8150-1-0,4565-1-0,1308-1-0,131-1-149,131-1-148,132-2-149,132-2-1000,132-2-148,132-3-149,132-3-1000,132-3-148,1306-1-0,1320-1-0,2543-1-0,2818-1-0,2630-1-0,3670-1-0,138-1-148,1319-1-0,139-1-950,139-1-149,139-1-148,3204-1-0,7634-1-0,140-2-148,997-1-148,3770-1-0,995-1-148,996-2-149,996-2-1000,996-2-148,996-3-149,996-3-1000,996-3-148,3588-1-0,3895-1-0,7360-1-0,2456-1-0,2873-1-0,3323-1-148,3324-1-148,141-2-149,141-2-148,141-3-149,141-3-1000,141-3-148,4233-1-0,4985-1-0,142-1-149,142-1-1000,142-1-148,143-3-148,144-2-149,144-2-148,144-3-149,144-3-148,144-3-1146,4335-1-0,145-1-148,6040-1-0,4861-1-0,1261-1-0,146-1-149,146-1-1000,146-1-998,146-1-148,3571-1-0,147-1-149,147-1-148,&category_sel=0&category="
	];
	NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL: url cachePolicy: NSURLRequestReturnCacheDataElseLoad timeoutInterval: 30.0
	];
	
	[_sportsWebView loadRequest: request];
}

@end
