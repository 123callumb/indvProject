//
//  studentAuth.m
//  Hard R
//
//  Created by Callum Beckwith on 22/03/2017.
//  Copyright © 2017 kilcal. All rights reserved.
//

#import "studentAuth.h"
#import "passwordData.h"
#import "studentData.h"

@implementation studentAuth

+(bool)canAccess:(NSString*)userID password:(NSString*)password {
    NSLog(@"ID:%@ Password:%@ Class:%d", userID, password, [studentData getSelectedClass]);

    
    if([userID containsString:@"1337"] && [password isEqualToString:[passwordData getStudentPassword]] && [studentData getSelectedClass] != 0){
        [studentData setStudentID:userID];
        return true;
    }else return false;
}

@end
