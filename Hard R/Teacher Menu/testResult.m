//
//  testResult.m
//  Hard R
//
//  Created by Callum Beckwith on 27/03/2017.
//  Copyright © 2017 kilcal. All rights reserved.
//

#import "testResult.h"
#import "centerPoint.h"
#import "quizData.h"

@implementation testResult

+(void)createTestResultView: (UIView*)v classNumber:(int)classNum dataID:(int)dataID {
    UIView *resultsView = [[UIView alloc] initWithFrame:CGRectMake(v.frame.size.width, v.frame.size.height/4, v.frame.size.width/1.2, v.frame.size.height/1.75)];
    UIImage *backingImage = [UIImage imageNamed:@"resultBox"];
    UIImageView *backingView = [[UIImageView alloc] initWithImage:backingImage];
    
    NSMutableDictionary *resultData = [quizData getQuizDataWithID:dataID fromClass:classNum];
    
    NSString *stundetID = [resultData objectForKey:@"studentID"];
    int score = [[resultData objectForKey:@"quizScore"] intValue];
    
    UILabel *studentNumber = [[UILabel alloc] initWithFrame:CGRectMake([centerPoint placeUIItemWithWidth:resultsView.frame.size.width/1.2 onCenterOfWidth:resultsView.frame.size.width], resultsView.frame.size.height/7, resultsView.frame.size.width/1.2, v.frame.size.height/8)];
    UILabel *scoreLabel = [[UILabel alloc] initWithFrame:CGRectMake([centerPoint placeUIItemWithWidth:resultsView.frame.size.width/1.2 onCenterOfWidth:resultsView.frame.size.width], resultsView.frame.size.height/4.45, resultsView.frame.size.width/1.2, v.frame.size.height/8)];
    
    UIImage *doneImage = [UIImage imageNamed:@"doneButtonSmall"];
    UIButton *done = [UIButton buttonWithType:UIButtonTypeCustom];
    
    [done setImage:doneImage forState:UIControlStateNormal];
    [done setFrame:CGRectMake([centerPoint placeUIItemWithWidth:doneImage.size.width/4 onCenterOfWidth:resultsView.frame.size.width], resultsView.frame.size.height/1.2, doneImage.size.width/4, doneImage.size.height/4)];
    [done addTarget:self action:@selector(onDoneButton:) forControlEvents:UIControlEventTouchUpInside];
    
    [backingView setFrame:CGRectMake(0, 0, resultsView.frame.size.width, resultsView.frame.size.height)];
    
    [studentNumber setText:[NSString stringWithFormat:@"Student ID. %@", stundetID]];
    [scoreLabel setText:[NSString stringWithFormat:@"%d/10", score]];
    [studentNumber setFont:[UIFont fontWithName:@"ArialRoundedMTBold" size:20]];
    [scoreLabel setFont:[UIFont fontWithName:@"ArialRoundedMTBold" size:20]];
    [studentNumber setTextAlignment:NSTextAlignmentCenter];
    [scoreLabel setTextAlignment:NSTextAlignmentCenter];


    
    [resultsView addSubview:backingView];
    
    NSData *quizData = [resultData objectForKey:@"quizData"];
    NSArray *quizArray = [NSKeyedUnarchiver unarchiveObjectWithData:quizData];
    [self createAnsResults:resultsView questions:quizArray];
    
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
        
        [medalView setFrame:CGRectMake([centerPoint placeUIItemWithWidth:medalImage.size.width/6 onCenterOfWidth:resultsView.frame.size.width], 0, medalImage.size.width/6, medalImage.size.height/6)];
        
        [resultsView addSubview:medalView];
        
    }
    
    [resultsView addSubview:studentNumber];
    [resultsView addSubview:scoreLabel];
    [resultsView addSubview:done];
    
    [v addSubview:resultsView];
    
    [UIView animateWithDuration:0.3 animations:^{
        [resultsView setFrame:CGRectMake([centerPoint placeUIItemWithWidth:v.frame.size.width/1.2 onCenterOfWidth:v.frame.size.width], v.frame.size.height/4, v.frame.size.width/1.2, v.frame.size.height/1.75)];
    }];
}
+(void)onDoneButton:(id)sender {
    UIButton *done = (UIButton*)sender;
    UIView *v = [done superview];
    UIView *v2 = [v superview];
    UIView *v3 = [v2 viewWithTag:69];
    
    [UIView animateWithDuration:0.3 animations:^{
        [v setFrame:CGRectMake(v2.frame.size.width, v2.frame.size.height/4, v.frame.size.width, v.frame.size.height)];
        [v3 setFrame:v2.frame];
    } completion:^(BOOL finished){
        [v removeFromSuperview];
    }];
}
+(void)createAnsResults:(UIView*)v questions:(NSArray*)questions {
    UIView *ansView = [[UIView alloc] initWithFrame:CGRectMake(0, v.frame.size.height/2.5, v.frame.size.width, v.frame.size.height/2)];
    
    for(int i = 0; i <= 9; i++){
        [self createTestQuestioBox:ansView questionsArray:questions withQuesID:i];
    }
    
    [v addSubview:ansView];
}

+(void)createTestQuestioBox: (UIView*)v questionsArray:(NSArray*)questions withQuesID:(int)questionID {
    NSMutableDictionary *questionData = [questions objectAtIndex:questionID];
    int isCorrect = [[questionData objectForKey:@"isCorrect"] intValue];
    int firstNumber = [[questionData objectForKey:@"firstNum"] intValue];
    int secondNumber = [[questionData objectForKey:@"secondNum"] intValue];
    NSString *symbol = [questionData objectForKey:@"symbol"];
    int theirAns = [[questionData objectForKey:@"ans"] intValue];
    
    NSString *tileTexture;
   
    if(isCorrect == 1){
        tileTexture = @"correctTile";
    }else {
        tileTexture = @"nopeTile";
    }
    
    UIImage *tileImage = [UIImage imageNamed:tileTexture];
    UIImageView *tileView = [[UIImageView alloc] initWithImage:tileImage];
    
    float tileXPos;
    
    if(questionID > 4){
        tileXPos = [centerPoint placeUIItemWithWidth:tileImage.size.width/4 onCenterOfWidth:v.frame.size.width] + tileImage.size.width/8;
    }else {
        tileXPos = [centerPoint placeUIItemWithWidth:tileImage.size.width/4 onCenterOfWidth:v.frame.size.width] - tileImage.size.width/8;
    }
    
    float tileYPos;
    
    if(questionID > 4){
        int tempID = questionID;
        tempID = tempID - 5;
        tileYPos = tileImage.size.height/4 * tempID;
    }else {
        tileYPos = tileImage.size.height/4 * questionID;

    }
    
    [tileView setFrame:CGRectMake(tileXPos, tileYPos, tileImage.size.width/4, tileImage.size.height/4)];
    
    UILabel *firstNumberLabel = [[UILabel alloc] initWithFrame:CGRectMake(tileView.frame.size.width/14, 0, tileView.frame.size.width/4, tileView.frame.size.height)];
    UILabel *secondNumberLabel = [[UILabel alloc] initWithFrame:CGRectMake(tileView.frame.size.width/2.8, 0, tileView.frame.size.width/4, tileView.frame.size.height)];
    UILabel *symbolLabel = [[UILabel alloc] initWithFrame:CGRectMake(tileView.frame.size.width/4.75, 0, tileView.frame.size.width/4, tileView.frame.size.height)];
    UILabel *ansLabel = [[UILabel alloc] initWithFrame:CGRectMake(tileView.frame.size.width/1.45, 0, tileView.frame.size.width/4, tileView.frame.size.height)];
    
    [firstNumberLabel setText:[NSString stringWithFormat:@"%d", firstNumber]];
    [secondNumberLabel setText:[NSString stringWithFormat:@"%d", secondNumber]];
    [ansLabel setText:[NSString stringWithFormat:@"%d", theirAns]];
    
    [firstNumberLabel setTextAlignment:NSTextAlignmentCenter];
    [secondNumberLabel setTextAlignment:NSTextAlignmentCenter];
    [ansLabel setTextAlignment:NSTextAlignmentCenter];
    [symbolLabel setTextAlignment:NSTextAlignmentCenter];

    
    [firstNumberLabel setFont:[UIFont fontWithName:@"ArialRoundedMTBold" size:12]];
    [secondNumberLabel setFont:[UIFont fontWithName:@"ArialRoundedMTBold" size:12]];
    [symbolLabel setFont:[UIFont fontWithName:@"ArialRoundedMTBold" size:12]];
    [ansLabel setFont:[UIFont fontWithName:@"ArialRoundedMTBold" size:12]];
    [ansLabel setTextColor:[UIColor whiteColor]];

    NSString *symbolFormatted;
    
    if([symbol isEqualToString:@"plusSymbol"]){
        symbolFormatted = @"+";
    }else if([symbol isEqualToString:@"subtractSymbol"]){
        symbolFormatted = @"-";
    }else if ([symbol isEqualToString:@"multiplySymbol"]){
        symbolFormatted = @"x";
    }else if ([symbol isEqualToString:@"divideSymbol"]){
        symbolFormatted = @"÷";
    }
    
    [symbolLabel setText:symbolFormatted];
    
    [tileView addSubview:firstNumberLabel];
    [tileView addSubview:symbolLabel];
    [tileView addSubview:secondNumberLabel];
    [tileView addSubview:ansLabel];
    
    [v addSubview:tileView];
    
}
@end
