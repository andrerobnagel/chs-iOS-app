//
//  PeriodViewController.h
//  RebelNet
//

#import <UIKit/UIKit.h>
#import "Constants.h"
#import "Period.h"

@interface PeriodViewController: UIViewController <UIPickerViewDelegate, UIPickerViewDataSource>

@property (nonatomic, copy) NSArray *classrooms;
@property (nonatomic) Period *period;

@end
