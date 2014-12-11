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
	
	NSURLRequest *request = [NSURLRequest requestWithURL: [NSURL URLWithString: @"http://srv1.advancedview.rschooltoday.com/public/conference/calendarreport/G5genie/581/G5button/13/school_id/5/category/0/preview/no/vw_activity/6353,8150,4565,3827,131,1308,132,1306,1320,2543,2818,2842,2630,3283,138,3670,993,139,1319,3204,7634,2572,140,4053,997,995,3770,996,3588,3895,4375,7360,1829,2456,2873,141,1368,4137,4233,4985,142,4015,143,4086,144,4335,145,4187,8112,6040,146,1261,147,3571/vw_conference_events/1/vw_non_conference_events/1/vw_homeonly/1/vw_awayonly/1/vw_schoolonly/1/vw_gender/1/vw_type/0/vw_level/0/category_sel/0/vw_opponent/0/vw_location_detail/0/opt_show_location/1/opt_show_bus_times/1/vw_location/0/vw_week/2014-12-01:2014-12-07/vw_month2/2014-12-01/vw_monthCnt/01/vw_month_from/12/vw_day_from/05/vw_year_from/2014/vw_month_to/01/vw_day_to/05/vw_year_to/2015/vw_period/school-yr/vw_school_year/0/test/test"]];
	[_sportsWebView loadRequest: request];
}

@end
