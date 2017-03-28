//
//  teacherLogin.m
//  Hard R
//
//  Created by Callum Beckwith on 24/03/2017.
//  Copyright © 2017 kilcal. All rights reserved.
//

#import "teacherLogin.h"
#import "centerPoint.h"
#import "passwordData.h"
#import "classSelector.h"

@implementation teacherLogin

NSString *tempTeacherPassword;

+(void)createTeacherMenu:(UIView*)v {
    UIView *teacherLogin = [[UIView alloc] initWithFrame:CGRectMake(-v.frame.size.width, 0, v.frame.size.width, v.frame.size.height)];
    UIImage *blankField = [UIImage imageNamed:@"blankTile"];
    UITextField *field = [[UITextField alloc] initWithFrame:CGRectMake([centerPoint placeUIItemWithWidth:blankField.size.width/4 onCenterOfWidth:v.frame.size.width], v.frame.size.height/2.2, blankField.size.width/4, blankField.size.height/4)];
    UIImage *doneImage = [UIImage imageNamed:@"doneButton"];
    UIButton *doneButton = [UIButton buttonWithType:UIButtonTypeCustom];
    UIImage *teacherImage = [UIImage imageNamed:@"teacherTitle"];
    UIImageView *teacherTitle = [[UIImageView alloc] initWithImage:teacherImage];
    
    [teacherTitle setFrame:CGRectMake([centerPoint placeUIItemWithWidth:teacherImage.size.width/4 onCenterOfWidth:v.frame.size.width], v.frame.size.height/4, teacherImage.size.width/4, teacherImage.size.height/4)];
    
    [field setBackground:blankField];
    [field setSecureTextEntry:YES];
    [field setTextAlignment:NSTextAlignmentCenter];
    [field setClearsOnInsertion:YES];
    [field addTarget:self action:@selector(updatePassword:) forControlEvents:UIControlEventAllEditingEvents];
    [doneButton setImage:doneImage forState:UIControlStateNormal];
    [doneButton setFrame:CGRectMake([centerPoint placeUIItemWithWidth:doneImage.size.width/4 onCenterOfWidth:v.frame.size.width], v.frame.size.height/1.85, doneImage.size.width/4, doneImage.size.height/4)];
    [doneButton addTarget:self action:@selector(passwordField:) forControlEvents:UIControlEventTouchUpInside];
    
    [teacherLogin addSubview:field];
    [teacherLogin addSubview:doneButton];
    [teacherLogin addSubview:teacherTitle];
    
    [v addSubview:teacherLogin];
    
    [UIView animateWithDuration:0.3 animations:^{
        [teacherLogin setFrame:v.frame];
    }];
}
+(void)passwordField:(id)sender {
    UIButton *done = (UIButton*)sender;
    UIView *v = [done superview];
    UIView *v1 = [v superview];
    
    if([tempTeacherPassword isEqualToString:[passwordData getTeacherPassword]]){
        [classSelector createClassSelector:v1];
        
        [UIView animateWithDuration:0.3 animations:^{
            [v setFrame:CGRectMake(v1.frame.size.width, 0, v.frame.size.width, v.frame.size.height)];
        } completion:^(BOOL finished){
            [v removeFromSuperview];
        }];
    }
}
+(void)updatePassword:(UITextField*)sender {
    UITextField *text = (UITextField*)sender;
    tempTeacherPassword = text.text;
}
@end
