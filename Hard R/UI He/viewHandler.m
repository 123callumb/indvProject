//
//  viewHandler.m
//  Hard R
//
//  Created by Callum Beckwith on 22/03/2017.
//  Copyright © 2017 kilcal. All rights reserved.
//

#import "viewHandler.h"
#import "mainMenu.h"

@implementation viewHandler

+(void)loadMenu: (UIView*)v {
    [mainMenu createMenu:v];
}
@end
