//
//  passwordData.m
//  Hard R
//
//  Created by Callum Beckwith on 22/03/2017.
//  Copyright © 2017 kilcal. All rights reserved.
//

#import "passwordData.h"

@implementation passwordData
NSString *studentPassword = @"s";
NSString *teacherPassword = @"t";

+(NSString*)getTeacherPassword {
    return teacherPassword;
}
+(NSString*)getStudentPassword {
    return studentPassword;
}
@end
