//
//  PeriodStore.h
//  RebelNet
//

#import <Foundation/Foundation.h>
#import "Constants.h"
#import "Period.h"


@interface PeriodStore: NSObject

+ (instancetype) sharedStore;
- (void) editPeriod: (NSUInteger) period newName: (NSString *) name newRoom: (NSString *) room;
- (Period *) periodAtIndex: (NSUInteger) index;
- (void) clearSchedule;
- (BOOL) saveChanges;

@end
