//
//  studentAuth.h
//  Hard R
//
//  Created by Callum Beckwith on 22/03/2017.
//  Copyright © 2017 kilcal. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface studentAuth : UIView
+(bool)canAccess:(NSString*)userID password:(NSString*)password;
@end
