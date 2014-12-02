//
//  Constants.h
//  RebelNet
//

#ifndef RebelNet_Constants_h
#define RebelNet_Constants_h

#define NUM_PERIODS 8


//Functions
//We need to trim a lot of strings, so instead of having this mess every time, shorten it
#define TRIM(str) [str stringByTrimmingCharactersInSet: [NSCharacterSet whitespaceAndNewlineCharacterSet]]


//Colors
#define REBELBLUE(a) [UIColor colorWithRed: 0.0823 green: 0.2 blue: 0.4745 alpha: a]
#define REBELSILVER(a) [UIColor colorWithRed: 0.8 green: 0.8 blue: 0.8 alpha: a]


//Values
#define STAFF_REDOWNLOAD_MONTH 8
#define STAFF_REDOWNLOAD_DAY 1

//This means that "it" isn't required, but there's no reason to not have it
#define SURE YES

#endif
