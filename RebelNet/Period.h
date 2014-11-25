//
//  Period.h
//  RebelNet
//

#import <Foundation/Foundation.h>
#import "Constants.h"

@interface Period: NSObject <NSCoding>

- (instancetype) initWithPeriod: (NSUInteger) period name: (NSString *) name classroom: (NSString *) classroom;
- (instancetype) initWithPeriod: (NSUInteger) period;


@property (nonatomic) NSUInteger periodNumber;
@property (nonatomic, copy) NSString *className, *classroom;

@end
