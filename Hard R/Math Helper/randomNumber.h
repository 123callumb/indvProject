//
//  randomNumber.h
//  Hard R
//
//  Created by Callum Beckwith on 23/03/2017.
//  Copyright © 2017 kilcal. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface randomNumber : NSObject
+(int)randomNumberBetween:(int)min maxNumber:(int)max;
+(float)randomFloatBetween:(int)min maxNumber:(int)max;
@end
