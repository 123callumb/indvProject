//
//  randomNumber.m
//  Hard R
//
//  Created by Callum Beckwith on 23/03/2017.
//  Copyright © 2017 kilcal. All rights reserved.
//

#import "randomNumber.h"

@implementation randomNumber
+(int)randomNumberBetween:(int)min maxNumber:(int)max
{
    return (int)min + arc4random_uniform(max - min + 1);
}
+(float)randomFloatBetween:(int)min maxNumber:(int)max
{
    return (float)min + arc4random_uniform(max - min + 1);
}
@end
