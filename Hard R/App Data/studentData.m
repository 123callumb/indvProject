//
//  studentData.m
//  Hard R
//
//  Created by Callum Beckwith on 22/03/2017.
//  Copyright © 2017 kilcal. All rights reserved.
//

#import "studentData.h"

@implementation studentData

int currentSelectedClass = 0;
NSString *studentId;

+(int)getSelectedClass {
    return currentSelectedClass;
}

+(void)setClass:(int)v {
    currentSelectedClass = v;
}

+(NSString*)getCurrentID {
    return studentId;
}
+(void)setStudentID:(NSString*)v {
    studentId = v;
}
@end
