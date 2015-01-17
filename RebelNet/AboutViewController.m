//
//  AboutViewController.m
//  RebelNet

#import "AboutViewController.h"

@interface AboutViewController()

@end


@implementation AboutViewController

#pragma mark - View life cycle

- (void) viewDidLoad {
	[super viewDidLoad];
	
	[self setTitle: @"About CHS"];
}


#pragma mark - Button link actions


- (IBAction) viewHomePage: (id) sender {
	[[UIApplication sharedApplication] openURL: [NSURL URLWithString: @"http://www.columbinerebels.net"]];
}


- (IBAction) viewTestScores: (id) sender {
	[[UIApplication sharedApplication] openURL: [NSURL URLWithString: @"http://www.jeffcopublicschools.org/schools/test_scores/high/columbine.pdf"]];
}


- (IBAction) viewDemographics: (id) sender {
	[[UIApplication sharedApplication] openURL: [NSURL URLWithString: @"http://www.jeffcopublicschools.org/schools/demographics/high/columbine.pdf"]];
}


- (IBAction) viewFeederSchools: (id) sender {
	[[UIApplication sharedApplication] openURL: [NSURL URLWithString: @"http://www.jeffcopublicschools.org/schools/profiles/articulation/"]];
}


- (IBAction) viewFacebook: (id) sender {
	[[UIApplication sharedApplication] openURL: [NSURL URLWithString: @"https://www.facebook.com/pages/Columbine-Athletics/505465839550994"]];
}


- (IBAction) viewTwitter: (id) sender {
	[[UIApplication sharedApplication] openURL: [NSURL URLWithString: @"https://twitter.com/rebel_athletics"]];
}


- (IBAction) viewMoreInfo: (id) sender {
	[[UIApplication sharedApplication] openURL: [NSURL URLWithString: @"http://www.jeffcopublicschools.org/schools/profiles/?school_id=102"]];
}


- (IBAction) viewCHSAF: (id) sender {
	[[UIApplication sharedApplication] openURL: [NSURL URLWithString: @"http://chsaf.org/wp/"]];
}

@end
