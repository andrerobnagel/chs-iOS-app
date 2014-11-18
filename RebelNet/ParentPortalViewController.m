//
//  ParentPortalViewController.m
//  RebelNet
//
//  Created by Andre on 11/18/14.
//

#import "ParentPortalViewController.h"

@interface ParentPortalViewController()

@property (weak, nonatomic) IBOutlet UIWebView *parentPortalView;

@end



@implementation ParentPortalViewController

//TODO: See if this works on an actual device running 7.1. Nothing shows in the 7.1 simulators.
//Load the login page for Parent Portal.
- (void) viewWillAppear: (BOOL) animated {
	[super viewWillAppear: animated];

	_parentPortalView.scalesPageToFit = YES;
	
	NSURLRequest *request = [NSURLRequest requestWithURL: [NSURL URLWithString: @"https://campus.jeffco.k12.co.us/campus/jeffco_IC.jsp"]];
	[_parentPortalView loadRequest: request];
}

@end
