//
//  centerPoint.m
//  Hard R
//
//  Created by Callum Beckwith on 22/03/2017.
//  Copyright © 2017 kilcal. All rights reserved.
//

#import "centerPoint.h"

@implementation centerPoint

+(float)placeUIItemWithWidth: (float)uiW onCenterOfWidth:(float)mainW {
    return mainW/2 - uiW/2;
}

@end
