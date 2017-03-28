//
//  quizFinished.m
//  Hard R
//
//  Created by Callum Beckwith on 24/03/2017.
//  Copyright © 2017 kilcal. All rights reserved.
//

#import "quizFinished.h"
#import "centerPoint.h"
#import "questionData.h"
#import "mainMenu.h"
#import "quizData.h"
#import "studentData.h"

@implementation quizFinished

+(void)createQuizFinsihedScreen: (UIView*)v {
    UIView *completeView = [[UIView alloc] initWithFrame:CGRectMake(0, -v.frame.size.height, v.frame.size.width, v.frame.size.width)];
    
    UIImage *titleImage = [UIImage imageNamed:@"testCompleteTitle"];
    UIImageView *title = [[UIImageView alloc] initWithFrame:CGRectMake([centerPoint placeUIItemWithWidth:titleImage.size.width/4 onCenterOfWidth:v.frame.size.width], v.frame.size.height/4, titleImage.size.width/4, titleImage.size.height/4)];
    
    [title setImage:titleImage];
    
    UILabel *score = [[UILabel alloc] initWithFrame:CGRectMake([centerPoint placeUIItemWithWidth:titleImage.size.width/4 onCenterOfWidth:v.frame.size.width], v.frame.size.height/1.75, titleImage.size.width/4, v.frame.size.width/4)];
    [score setText:[NSString stringWithFormat:@"%d/10", [questionData getCurrentCorectQuestions]]];
    [score setTextAlignment:NSTextAlignmentCenter];
    [score setFont:[UIFont fontWithName:@"ArialRoundedMTBold" size:30]];
    [score setTextColor:[UIColor whiteColor]];
    
    UIImage *backImage = [UIImage imageNamed:@"backButton"];
    UIButton *backButton = [UIButton buttonWithType:UIButtonTypeCustom];
    
    [backButton setImage:backImage forState:UIControlStateNormal];
    [backButton setFrame:CGRectMake(0 + backImage.size.width/12, v.frame.size.height - backImage.size.height/3 - backImage.size.width/12, backImage.size.width/3, backImage.size.height/3)];
    [backButton addTarget:self action:@selector(onBack:) forControlEvents:UIControlEventTouchUpInside];
    
    if([questionData getCurrentCorectQuestions] >= 7){
       
        NSString *medal;
        
        if([questionData getCurrentCorectQuestions] == 7 || [questionData getCurrentCorectQuestions] == 8){
            medal = @"bronzeAward";
        }
        if([questionData getCurrentCorectQuestions] == 9){
            medal = @"silverAward";
        }
        if([questionData getCurrentCorectQuestions] == 10){
            medal = @"goldAward";
        }
        UIImage *medalImage = [UIImage imageNamed:medal];
        UIImageView *medalView = [[UIImageView alloc] initWithImage:medalImage];
        
        [medalView setFrame:CGRectMake([centerPoint placeUIItemWithWidth:medalImage.size.width/4 onCenterOfWidth:v.frame.size.width], v.frame.size.height/2.65, medalImage.size.width/4, medalImage.size.height/4)];
        
        [completeView addSubview:medalView];
    }
    
    
    [completeView addSubview:backButton];
    [completeView addSubview:title];
    [completeView addSubview:score];
    
    [v addSubview:completeView];
    
    //Add Quiz Data
    [quizData storeQuizDataForClass:[studentData getSelectedClass]
                          studentID:[studentData getCurrentID]
                         quizResult:[questionData getCurrentQuizData]
                              score:[questionData getCurrentCorectQuestions]
     ];
    NSLog(@"Storing Student ID:%@ for Class:%d with Score:%d/10", [studentData getCurrentID], [studentData getSelectedClass], [questionData getCurrentCorectQuestions]);
    
    [UIView animateWithDuration:0.3 animations:^{
        [completeView setFrame:v.frame];
    }];
}
+(void)onBack:(id)sender {
    UIButton *back = (UIButton*)sender;
    UIView *v = [back superview];
    UIView *v2 = [v superview];
    
    [mainMenu createMenu:v2];
    
    [UIView animateWithDuration:0.3 animations:^{
        [v setFrame:CGRectMake(v.frame.size.width, 0, v.frame.size.width, v.frame.size.height)];
    } completion:^(BOOL finished){
        [v removeFromSuperview];
        [questionData resetQuestionNumber];
    }];
    
}

@end
