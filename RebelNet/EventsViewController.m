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
	
	NSURLRequest *request = [NSURLRequest requestWithURL: [NSURL URLWithString: @"http://srv1.advancedview.rschooltoday.com/public/conference/calendarreport/G5genie/581/G5button/13/school_id/5/category/0/preview/no/vw_activity/3224,4374,4931,4864,2656,7088,3682,6942,4552,4833,4832,4834,3678,4867,3068,3720,1376,3521,2314,5268,5695,6097,1616,1762,5003,3858,3311,5063,4089,3185,2853,1375,3330,3445,6510,2852,7640,1688,3700,6074,4284,3841,3257,7236,4042,3266,5912,6377,3767,5884,5490,5555,6793,6339,7242,3585,4847,2786,6340,1262,5496,3940,3258,4862,2850,1614,3120,5041,5827,4893,4894,4895,3069,7243,1369,2874,3343,3119,4892,2848,2849,7027,5460,6011,4714,2655,5156,4869,3354,3265,2851,6589,5016,3939,5863,4088,7087,6486,7420,4863,5785,3323,3324,3228,5157,4897,4615,6638,5012,4474,4527,3369,2819,5280,4861,1615,4514,2877,5843,3846,3342/vw_conference_events/1/vw_non_conference_events/1/vw_homeonly/1/vw_awayonly/1/vw_schoolonly/1/vw_gender/1/vw_type/0/vw_level/0/category_sel/0/vw_opponent/0/vw_location_detail/0/opt_show_location/1/opt_show_bus_times/1/vw_location/0/vw_week/2014-12-01:2014-12-07/vw_month2/2014-12-01/vw_monthCnt/01/vw_month_from/12/vw_day_from/02/vw_year_from/2014/vw_month_to/01/vw_day_to/02/vw_year_to/2015/vw_period/school-yr/vw_school_year/0/test/test"]];
	[_eventsWebView loadRequest: request];
}

@end
