//
//  studentData.h
//  Hard R
//
//  Created by Callum Beckwith on 22/03/2017.
//  Copyright © 2017 kilcal. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface studentData : NSObject
+(int)getSelectedClass;
+(void)setClass:(int)v;
+(NSString*)getCurrentID;
+(void)setStudentID:(NSString*)v;
@end
