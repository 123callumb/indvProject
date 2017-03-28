//
//  classView.m
//  Hard R
//
//  Created by Callum Beckwith on 26/03/2017.
//  Copyright © 2017 kilcal. All rights reserved.
//

#import "classView.h"
#import "centerPoint.h"
#import "quizData.h"
#import "testResult.h"
#import "classSelector.h"

@implementation classView

+(void)createClassResults:(UIView*)v classNumber:(int)classNo {
    UIView *main = [[UIView alloc] initWithFrame:CGRectMake(v.frame.size.width, 0, v.frame.size.width, v.frame.size.height)];
    UIView *classView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, v.frame.size.width, v.frame.size.height)];
    
    [classView setTag:69];
    
    UIImage *classTitle = [UIImage imageNamed:[NSString stringWithFormat:@"class%dTitle", classNo]];
    UIImageView *classTitleView = [[UIImageView alloc] initWithImage:classTitle];
    
    [classTitleView setFrame:CGRectMake([centerPoint placeUIItemWithWidth:classTitle.size.width/4 onCenterOfWidth:v.frame.size.width], v.frame.size.height/6, classTitle.size.width/4, classTitle.size.height/4)];
    
    UIImage *backImage = [UIImage imageNamed:@"backButton"];
    UIButton *backButton = [UIButton buttonWithType:UIButtonTypeCustom];
    
    [backButton setImage:backImage forState:UIControlStateNormal];
    [backButton setFrame:CGRectMake(0 + backImage.size.width/12, v.frame.size.height - backImage.size.height/3 - backImage.size.width/12, backImage.size.width/3, backImage.size.height/3)];
    [backButton addTarget:self action:@selector(onBack:) forControlEvents:UIControlEventTouchUpInside];
    
    [main addSubview:classTitleView];


    [self addQuizDataList:classView classNumber:classNo];
    
    [main addSubview:classView];
    [main addSubview:backButton];
    
    [v addSubview:main];
    
    [UIView animateWithDuration:0.3 animations:^{
        [main setFrame:v.frame];
    }];
}
+(void)addQuizDataList:(UIView*)v classNumber:(int)classNo {
    UIScrollView *list = [[UIScrollView alloc] initWithFrame:CGRectMake([centerPoint placeUIItemWithWidth:v.frame.size.width/1.2 onCenterOfWidth:v.frame.size.width], v.frame.size.height/4, v.frame.size.width/1.2, v.frame.size.height/1.75)];
    
    if([quizData getClassData:classNo] != nil){
        for(int i = 0; i <= [[quizData getClassData:classNo] count] - 1; i++){
            [self createDataTile:list dataID:i forClass:classNo];
        }
    }
    
    [list setContentSize:CGSizeMake(list.frame.size.width, list.frame.size.height/6 * [[quizData getClassData:classNo] count])];
    
    [v addSubview:list];
}
+(void)createDataTile:(UIView*)v dataID:(int)dataID forClass:(int)classNumber {
    UIImage *tileImage = [UIImage imageNamed:@"resultTile"];
    UIImageView *dataTile = [[UIImageView alloc] initWithImage:tileImage];
    UIImage *viewImage = [UIImage imageNamed:@"viewTestButton"];
    UIButton *testButton = [UIButton buttonWithType:UIButtonTypeCustom];
    
    
    [dataTile setFrame:CGRectMake([centerPoint placeUIItemWithWidth:tileImage.size.width/4 onCenterOfWidth:v.frame.size.width], tileImage.size.height/4 * dataID, tileImage.size.width/4, tileImage.size.height/4)];
    
    NSMutableDictionary *tileData = [quizData getQuizDataWithID:dataID fromClass:classNumber];
    UILabel *studentID = [[UILabel alloc] initWithFrame:CGRectMake(dataTile.frame.size.width/3.8, dataTile.frame.size.height/7, dataTile.frame.size.width/6, dataTile.frame.size.height/3)];
    UILabel *score = [[UILabel alloc] initWithFrame:CGRectMake(dataTile.frame.size.width/6, dataTile.frame.size.height/2.1, dataTile.frame.size.width/3, dataTile.frame.size.height/3)];
    
    [testButton setImage:viewImage forState:UIControlStateNormal];
    [testButton setFrame:CGRectMake(dataTile.frame.size.width/2.2, dataTile.frame.size.height/4, viewImage.size.width/4, viewImage.size.height/4)];
    [testButton setTag:(classNumber*100) + dataID];
    [testButton addTarget:self action:@selector(onTestButton:) forControlEvents:UIControlEventTouchUpInside];
    
    [studentID setText:[tileData objectForKey:@"studentID"]];
    [score setText:[NSString stringWithFormat:@"%d out of 10", [[tileData objectForKey:@"quizScore"] intValue]]];
    
    [studentID setTextAlignment:NSTextAlignmentLeft];
    [score setTextAlignment:NSTextAlignmentLeft];
    
    [studentID setFont:[UIFont fontWithName:@"ArialRoundedMTBold" size:13]];
    [score setFont:[UIFont fontWithName:@"ArialRoundedMTBold" size:13]];
    
    [dataTile setUserInteractionEnabled:YES];
    
    [self addMedal:dataTile score:[[tileData objectForKey:@"quizScore"] intValue]];
    [dataTile addSubview:studentID];
    [dataTile addSubview:score];
    [dataTile addSubview:testButton];
    
    [v addSubview:dataTile];
}
+(void)addMedal:(UIImageView*)v score:(int)score{
    
    if(score > 6){
    NSString *medalTexture;
    
    if(score == 10){
        medalTexture = @"goldAward";
    }else if(score == 9){
        medalTexture = @"silverAward";
    }else {
        medalTexture = @"bronzeAward";
    }
    
    UIImage *medalImage = [UIImage imageNamed:medalTexture];
    UIImageView *medalView = [[UIImageView alloc] initWithImage:medalImage];
    
    [medalView setFrame:CGRectMake(v.frame.size.width/1.25, 0, medalImage.size.width/8.5, medalImage.size.height/8.75)];
    
    [v addSubview:medalView];
    
    }
}
+(void)onTestButton:(id)sender {
    UIButton *testButton = (UIButton*)sender;
    UIView *v = [testButton superview];
    UIScrollView *v1 = (UIScrollView*)[v superview];
    UIView *v2 = [v1 superview];
    UIView *v3 = [v2 superview];
    
    int quizID = (int)testButton.tag;
    
    if(quizID >= 300){
        quizID = quizID - 300;
        [testResult createTestResultView:v3 classNumber:3 dataID:quizID];
        NSLog(@"data id of %d", quizID);
    }
    if(quizID >= 200){
        quizID = quizID - 200;
        [testResult createTestResultView:v3 classNumber:2 dataID:quizID];
        NSLog(@"data id of %d", quizID);
    }
    if(quizID >= 100){
        quizID = quizID - 100;
        [testResult createTestResultView:v3 classNumber:1 dataID:quizID];
        NSLog(@"data id of %d", quizID);
    }
    
    [UIView animateWithDuration:0.3 animations:^{
        [v2 setFrame:CGRectMake(-v2.frame.size.width, 0, v2.frame.size.width, v2.frame.size.width)];
    }];
    
}
+(void)onBack:(id)sender {
    UIButton *back = (UIButton*)sender;
    UIView *v = [back superview];
    UIView *v2 = [v superview];
    
    [classSelector createClassSelector:v2];
    
    [UIView animateWithDuration:0.3 animations:^{
        [v setFrame:CGRectMake(v.frame.size.width, 0, v.frame.size.width, v.frame.size.height)];
    } completion:^(BOOL finished){
        [v removeFromSuperview];
    }];
    
}
@end
