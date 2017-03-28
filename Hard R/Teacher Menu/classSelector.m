//
//  classSelector.m
//  Hard R
//
//  Created by Callum Beckwith on 26/03/2017.
//  Copyright © 2017 kilcal. All rights reserved.
//

#import "classSelector.h"
#import "centerPoint.h"
#import "classView.h"
#import "viewHandler.h"

@implementation classSelector

+(void)createClassSelector: (UIView*)v {
    UIView *classView = [[UIView alloc] initWithFrame:CGRectMake(v.frame.size.width, 0, v.frame.size.width, v.frame.size.height)];
    
    UIImage *teacherImage = [UIImage imageNamed:@"teacherTitle"];
    UIImageView *teacherTitle = [[UIImageView alloc] initWithImage:teacherImage];
    
    [teacherTitle setFrame:CGRectMake([centerPoint placeUIItemWithWidth:teacherImage.size.width/4 onCenterOfWidth:v.frame.size.width], v.frame.size.height/4, teacherImage.size.width/4, teacherImage.size.height/4)];
    
    UIButton *class1Button = [UIButton buttonWithType:UIButtonTypeCustom];
    UIButton *class2Button = [UIButton buttonWithType:UIButtonTypeCustom];
    UIButton *class3Button = [UIButton buttonWithType:UIButtonTypeCustom];
    
    UIImage *class1Image = [UIImage imageNamed:@"class1TileButton"];
    UIImage *class2Image = [UIImage imageNamed:@"class2TileButton"];
    UIImage *class3Image = [UIImage imageNamed:@"class3TileButton"];
    
    [class1Button setImage:class1Image forState:UIControlStateNormal];
    [class2Button setImage:class2Image forState:UIControlStateNormal];
    [class3Button setImage:class3Image forState:UIControlStateNormal];
    
    [class1Button setTag:21];
    [class2Button setTag:22];
    [class3Button setTag:23];
    
    [class1Button addTarget:self action:@selector(classButton:) forControlEvents:UIControlEventTouchUpInside];
    [class2Button addTarget:self action:@selector(classButton:) forControlEvents:UIControlEventTouchUpInside];
    [class3Button addTarget:self action:@selector(classButton:) forControlEvents:UIControlEventTouchUpInside];

    [class1Button setFrame:CGRectMake([centerPoint placeUIItemWithWidth:class1Image.size.width/4 onCenterOfWidth:v.frame.size.width], v.frame.size.height/2.6, class1Image.size.width/4, class1Image.size.height/4)];
    [class2Button setFrame:CGRectMake([centerPoint placeUIItemWithWidth:class1Image.size.width/4 onCenterOfWidth:v.frame.size.width], v.frame.size.height/2.125, class1Image.size.width/4, class1Image.size.height/4)];
    [class3Button setFrame:CGRectMake([centerPoint placeUIItemWithWidth:class1Image.size.width/4 onCenterOfWidth:v.frame.size.width], v.frame.size.height/1.8, class1Image.size.width/4, class1Image.size.height/4)];
    
    [classView addSubview:class1Button];
    [classView addSubview:class2Button];
    [classView addSubview:class3Button];
    [classView addSubview:teacherTitle];
    
    UIImage *backImage = [UIImage imageNamed:@"backButton"];
    UIButton *backButton = [UIButton buttonWithType:UIButtonTypeCustom];
    
    [backButton setImage:backImage forState:UIControlStateNormal];
    [backButton setFrame:CGRectMake(0 + backImage.size.width/12, v.frame.size.height - backImage.size.height/3 - backImage.size.width/12, backImage.size.width/3, backImage.size.height/3)];
    [backButton addTarget:self action:@selector(onBack:) forControlEvents:UIControlEventTouchUpInside];

    [classView addSubview:backButton];
    
    [v addSubview:classView];
    
    [UIView animateWithDuration:0.3 animations:^{
        [classView setFrame:v.frame];
    }];
}
+(void)classButton:(id)sender {
    UIButton *but = (UIButton*)sender;
    UIView *v = [but superview];
    UIView *v2 = [v superview];
    
    [classView createClassResults:v2 classNumber:(int)but.tag - 20];
    [self removeView:v];
}

+(void)removeView: (UIView*)v {
    [UIView animateWithDuration:0.3 animations:^{
        [v setFrame:CGRectMake(-v.frame.size.width, 0, v.frame.size.width, v.frame.size.height)];
    } completion:^(BOOL finsihed){
        [v removeFromSuperview];
    }];
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
