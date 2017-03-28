//
//  mainMenu.m
//  Hard R
//
//  Created by Callum Beckwith on 22/03/2017.
//  Copyright © 2017 kilcal. All rights reserved.
//

#import "mainMenu.h"
#import "centerPoint.h"
#import "studentLoginMenu.h"
#import "teacherLogin.h"

@implementation mainMenu

+(void)createMenu: (UIView*)v {
    UIView *main = [[UIView alloc] initWithFrame:v.frame];
    [main setTag:1];
    UIImage *welcomeImage = [UIImage imageNamed:@"welcomeTitle"];
    UIImage *studentsImage = [UIImage imageNamed:@"studentButton"];
    UIImage *teacherImage = [UIImage imageNamed:@"teacherButton"];
    UIImageView *welcomeTitle = [[UIImageView alloc] initWithImage:welcomeImage];
    UIButton *studentButton = [UIButton buttonWithType:UIButtonTypeCustom];
    UIButton *teacherButton = [UIButton buttonWithType:UIButtonTypeCustom];
    
    [welcomeTitle setFrame:CGRectMake([centerPoint placeUIItemWithWidth:welcomeImage.size.width/4 onCenterOfWidth:main.frame.size.width], main.frame.size.height/4, welcomeImage.size.width/4, welcomeImage.size.height/4)];
    [studentButton setImage:studentsImage forState:UIControlStateNormal];
    [teacherButton setImage:teacherImage forState:UIControlStateNormal];
    [studentButton setFrame:CGRectMake([centerPoint placeUIItemWithWidth:teacherImage.size.width/4 onCenterOfWidth:main.frame.size.width], main.frame.size.height/2.25, studentsImage.size.width/4, studentsImage.size.height/4)];
    [teacherButton setFrame:CGRectMake([centerPoint placeUIItemWithWidth:teacherImage.size.width/4 onCenterOfWidth:main.frame.size.width], main.frame.size.height/1.85, studentsImage.size.width/4, studentsImage.size.height/4)];
    
    [studentButton addTarget:self action:@selector(onStudent:) forControlEvents:UIControlEventTouchUpInside];
    [teacherButton addTarget:self action:@selector(onTeacherPass:) forControlEvents:UIControlEventTouchUpInside];
    
    [main addSubview:welcomeTitle];
    [main addSubview:studentButton];
    [main addSubview:teacherButton];
    
    [v addSubview:main];
}
+(void)onStudent:(id)sender {
    UIButton *but = (UIButton*)sender;
    UIView *v = [but superview];
    UIView *v1 = [v superview];
    
    [self removeMenu:v1];
    [studentLoginMenu createStudentLogin:v1];
}
+(void)onTeacherPass: (id)sender {
    UIButton *teacher = (UIButton*)sender;
    UIView *v = [teacher superview];
    UIView *v1 = [v superview];
    
    [self removeMenu:v1];
    [teacherLogin createTeacherMenu:v1];
}
+(void)removeMenu: (UIView*)v {
    UIView *main = [v viewWithTag:1];
    
    [UIView animateWithDuration:0.3 animations:^{
        [main setFrame:CGRectMake(-v.frame.size.width, 0, main.frame.size.width, main.frame.size.height)];
    } completion:^(BOOL fisnished){
        [main removeFromSuperview];
    }];
    
}
@end
