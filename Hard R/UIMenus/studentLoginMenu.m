//
//  studentLoginMenu.m
//  Hard R
//
//  Created by Callum Beckwith on 22/03/2017.
//  Copyright © 2017 kilcal. All rights reserved.
//

#import "studentLoginMenu.h"
#import "centerPoint.h"
#import "studentData.h"
#import "studentAuth.h"
#import "quizScreen.h"
#import "viewHandler.h"

@implementation studentLoginMenu

NSString *tempPass;
NSString *tempID;

+(void)createStudentLogin: (UIView*)v {
    UIView *mainStudent = [[UIView alloc] initWithFrame:CGRectMake(v.frame.size.width, 0, v.frame.size.width, v.frame.size.height)];
    UIImage *studentTitleImage = [UIImage imageNamed:@"studentTitle"];
    UIImage *textField = [UIImage imageNamed:@"blankTile"];
    UIImageView *studentTitle = [[UIImageView alloc] initWithImage:studentTitleImage];
    UITextField *studentId = [[UITextField alloc] initWithFrame:CGRectMake([centerPoint placeUIItemWithWidth:textField.size.width/4 onCenterOfWidth:mainStudent.frame.size.width], mainStudent.frame.size.height/2.5, textField.size.width/4, textField.size.height/4)];
    UITextField *studentPassword = [[UITextField alloc] initWithFrame:CGRectMake([centerPoint placeUIItemWithWidth:textField.size.width/4 onCenterOfWidth:mainStudent.frame.size.width], mainStudent.frame.size.height/2.05, textField.size.width/4, textField.size.height/4)];
    UIImage *doneImage = [UIImage imageNamed:@"doneButton"];
    UIButton *doneButton = [UIButton buttonWithType:UIButtonTypeCustom];

    [studentTitle setFrame:CGRectMake([centerPoint placeUIItemWithWidth:studentTitleImage.size.width/4 onCenterOfWidth:mainStudent.frame.size.width], mainStudent.frame.size.height/4, studentTitleImage.size.width/4, studentTitleImage.size.height/4)];
    [studentId setText:@"Student ID"];
    [studentId setTextAlignment:NSTextAlignmentCenter];
    [studentId setClearsOnBeginEditing:YES];
    [studentId addTarget:self action:@selector(studentID:) forControlEvents:UIControlEventAllEditingEvents];
    [studentId setBackground:textField];
    [studentId setKeyboardType:UIKeyboardTypeASCIICapableNumberPad];
    
    [studentPassword setText:@"Password"];
    [studentPassword setTextAlignment:NSTextAlignmentCenter];
    [studentPassword setClearsOnBeginEditing:YES];
    [studentPassword setSecureTextEntry:YES];
    [studentPassword addTarget:self action:@selector(studentPassword:) forControlEvents:UIControlEventAllEditingEvents];
    [studentPassword setBackground:textField];
    
    [doneButton setImage:doneImage forState:UIControlStateNormal];
    [doneButton setFrame:CGRectMake([centerPoint placeUIItemWithWidth:doneImage.size.width/4 onCenterOfWidth:mainStudent.frame.size.width], mainStudent.frame.size.height/1.5, doneImage.size.width/4, doneImage.size.height/4)];
    [doneButton addTarget:self action:@selector(onDoneButton:) forControlEvents:UIControlEventTouchUpInside];
    
    [mainStudent addSubview:doneButton];
    [self addClassSelector:mainStudent];
    [mainStudent addSubview:studentTitle];
    [mainStudent addSubview:studentId];
    [mainStudent addSubview:studentPassword];
    
    UIImage *backImage = [UIImage imageNamed:@"backButton"];
    UIButton *backButton = [UIButton buttonWithType:UIButtonTypeCustom];
    
    [backButton setImage:backImage forState:UIControlStateNormal];
    [backButton setFrame:CGRectMake(0 + backImage.size.width/12, v.frame.size.height - backImage.size.height/3 - backImage.size.width/12, backImage.size.width/3, backImage.size.height/3)];
    [backButton addTarget:self action:@selector(onBack:) forControlEvents:UIControlEventTouchUpInside];
    
    [mainStudent addSubview:backButton];
    
    [v addSubview:mainStudent];
    
    [UIView animateWithDuration:0.3 animations:^{
        [mainStudent setFrame:v.frame];
    }];

}
+(void)studentID:(UITextField*)sender {
    UITextField *field = (UITextField*)sender;
    tempID = field.text;
}
+(void)studentPassword:(UITextField*)sender {
    UITextField *field = (UITextField*)sender;
    tempPass = field.text;
}
+(void)addClassSelector:(UIView*)v {
    UIView *classPanel = [[UIView alloc] initWithFrame:v.frame];
    [classPanel setFrame:CGRectMake([centerPoint placeUIItemWithWidth:v.frame.size.width/1.425 onCenterOfWidth:v.frame.size.width], v.frame.size.height/1.725, v.frame.size.width/1.5, v.frame.size.height/8)];
    
    UIImage *classImage = [UIImage imageNamed:@"classTile"];
    UIImage *class1 = [UIImage imageNamed:@"class1Button"];
    UIImage *class1Sel = [UIImage imageNamed:@"class1ButtonSel"];
    UIImage *class2 = [UIImage imageNamed:@"class2Button"];
    UIImage *class2Sel = [UIImage imageNamed:@"class2ButtonSel"];
    UIImage *class3 = [UIImage imageNamed:@"class3Button"];
    UIImage *class3Sel = [UIImage imageNamed:@"class3ButtonSel"];
    
    UIImageView *class = [[UIImageView alloc] initWithImage:classImage];
    UIButton *class1Button = [UIButton buttonWithType:UIButtonTypeCustom];
    UIButton *class2Button = [UIButton buttonWithType:UIButtonTypeCustom];
    UIButton *class3Button = [UIButton buttonWithType:UIButtonTypeCustom];
    
    [class1Button setImage:class1 forState:UIControlStateNormal];
    [class2Button setImage:class2 forState:UIControlStateNormal];
    [class3Button setImage:class3 forState:UIControlStateNormal];
    
    [class1Button addTarget:self action:@selector(onClass1:) forControlEvents:UIControlEventTouchUpInside];
    [class2Button addTarget:self action:@selector(onClass2:) forControlEvents:UIControlEventTouchUpInside];
    [class3Button addTarget:self action:@selector(onClass3:) forControlEvents:UIControlEventTouchUpInside];
    
    if([studentData getSelectedClass] == 1){
        [class1Button setImage:class1Sel forState:UIControlStateNormal];
    }
    if([studentData getSelectedClass] == 2){
        [class2Button setImage:class2Sel forState:UIControlStateNormal];
    }
    if([studentData getSelectedClass] == 3){
        [class3Button setImage:class3Sel forState:UIControlStateNormal];
    }
    
    [class setFrame:CGRectMake(0, 0, classImage.size.width/4, classImage.size.height/4)];
    [class1Button setFrame:CGRectMake(classImage.size.width/4.15, 0, class1.size.width/4, class1.size.height/4)];
    [class2Button setFrame:CGRectMake(classImage.size.width/2.65, 0, class1.size.width/4, class1.size.height/4)];
    [class3Button setFrame:CGRectMake(classImage.size.width/1.95, 0, class1.size.width/4, class1.size.height/4)];

    [classPanel addSubview:class];
    [classPanel addSubview:class1Button];
    [classPanel addSubview:class2Button];
    [classPanel addSubview:class3Button];

    [v addSubview:classPanel];
}
+(void)onClass1:(id)sender {
    UIButton *but = (UIButton*)sender;
    UIView *v = [but superview];
    UIView *v1 = [v superview];
    
    [studentData setClass:1];
    [self addClassSelector:v1];
    [v removeFromSuperview];
}
+(void)onClass2:(id)sender {
    UIButton *but = (UIButton*)sender;
    UIView *v = [but superview];
    UIView *v1 = [v superview];
    
    [studentData setClass:2];
    [self addClassSelector:v1];
    [v removeFromSuperview];
}
+(void)onClass3:(id)sender {
    UIButton *but = (UIButton*)sender;
    UIView *v = [but superview];
    UIView *v1 = [v superview];
    
    [studentData setClass:3];
    [self addClassSelector:v1];
    [v removeFromSuperview];
}
+(void)onDoneButton:(id)sender {
    UIButton *done = (UIButton*)sender;
    UIView *v = [done superview];
    
    if([studentAuth canAccess:tempID password:tempPass]){
        [quizScreen startQuiz:[v superview]];
        [UIView animateWithDuration:0.3 animations:^{
            [v setFrame:CGRectMake(-v.frame.size.width, 0, v.frame.size.width, v.frame.size.height)];
            [v removeFromSuperview];
        }];
    }else {
        [self createIncorrectDetailsWarner:v];
    }
}
+(void)createIncorrectDetailsWarner: (UIView*)v {
    if ([v viewWithTag:1001] == nil) {

    UILabel *nah = [[UILabel alloc] initWithFrame:CGRectMake([centerPoint placeUIItemWithWidth:v.frame.size.width/1.5 onCenterOfWidth:v.frame.size.width], v.frame.size.height/1.35, v.frame.size.width/1.5, v.frame.size.height/8)];
    [nah setFont:[UIFont fontWithName:@"ArialRoundedMTBold " size:2.0]];
    [nah setText:@"Please make sure you have entered the correct details"];
    [nah setAlpha:0.0];
    [nah setLineBreakMode:0];
    [nah setNumberOfLines:3];
    [nah setTextAlignment:NSTextAlignmentCenter];
    [nah setTag:1001];
    [nah setTextColor:[UIColor redColor]];
    [v addSubview:nah];
    
    [UIView animateWithDuration:0.3 animations:^{
        [nah setAlpha:1.0];

    }];
    
    }
}
+(void)onBack:(id)sender {
    UIButton *backBut = (UIButton*)sender;
    UIView *v = [backBut superview];
    UIView *v2 = [v superview];
    
    [viewHandler loadMenu:v2];
    
    [UIView animateWithDuration:0.3 animations:^{
        [v setFrame:CGRectMake(0, v.frame.size.height, v.frame.size.width, v.frame.size.height)];
    } completion:^(BOOL finished){
        [v removeFromSuperview];
    }];
}
@end
