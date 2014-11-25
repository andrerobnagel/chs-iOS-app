//
//  ScheduleCell.h
//  RebelNet
//

#import <UIKit/UIKit.h>
#import "Period.h"

@interface ScheduleCell: UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *classPeriodLabel;
@property (weak, nonatomic) IBOutlet UILabel *classNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *classroomLabel;

@end
