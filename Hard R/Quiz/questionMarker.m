//
//  questionMarker.m
//  Hard R
//
//  Created by Callum Beckwith on 24/03/2017.
//  Copyright © 2017 kilcal. All rights reserved.
//

#import "questionMarker.h"
#import "quizSlide.h"
#import "questionView.h"
#import "questionData.h"
#import "quizFinished.h"

@implementation questionMarker

+(void)markQuestion:(UIView*)v correct:(bool)isCorrect {
        
        NSString *markImage;
   
        if(isCorrect){
            markImage = @"correct";
        }else {
            markImage = @"nope";
        }
    
        UIImage *markI = [UIImage imageNamed:markImage];
        UIButton *markUI = [UIButton buttonWithType:UIButtonTypeCustom];
    
        [markUI setImage:markI forState:UIControlStateNormal];
        [markUI setFrame:CGRectMake(0, -v.frame.size.height, v.frame.size.width, v.frame.size.width)];
        [markUI setImage:markI forState:UIControlStateHighlighted];
        [markUI addTarget:self action:@selector(onTap:) forControlEvents:UIControlEventTouchUpInside];
    
        NSDictionary *quesData = [self getCurrentQuestionData:isCorrect];
        [questionData storeTempQuestionData:quesData];
        NSLog(@"question is %@", [quesData objectForKey:@"ans"]);
        NSLog(@"question saved ans is %d", [[[questionData getTempQuestionDataFromQuestion:[questionData getQuestion]] objectForKey:@"ans"] intValue]);
        [v addSubview:markUI];
    
        [UIView animateWithDuration:0.3 animations:^{
            [questionData increaseQuestionNumber];
            [markUI setFrame:v.frame];
        }];
        
}
+(void)onTap: (id)sender {
    
    UIButton *but = (UIButton*)sender;
    UIView *v = [but superview];
    
    [questionView resetQuestionTempVariables];
    
     if([questionData getQuestion] != 11){
         
         [quizSlide generateSlide:v];
         
    }else {
    
        [quizFinished createQuizFinsihedScreen:v];
    
    }
    
    [UIView animateWithDuration:0.3 animations:^{
        [but setFrame:CGRectMake(0, v.frame.size.height, v.frame.size.width, v.frame.size.height)];
    } completion:^(BOOL finished){
        [but removeFromSuperview];
    }];
    
}
+(NSMutableDictionary*)getCurrentQuestionData: (bool)correct {
    
    NSMutableDictionary *quesData = [[NSMutableDictionary alloc] init];
    
    int correctInt;
    
    if(correct){
        correctInt = 1;
    }else {
        correctInt = 0;
    }
    
    [quesData setObject:[NSNumber numberWithInt:[questionView getTempFirstNumber]] forKey:@"firstNum"];
    [quesData setObject:[NSNumber numberWithInt:[questionView getTempSecondNumber]] forKey:@"secondNum"];
    [quesData setObject:[questionView getTempSymbol] forKey:@"symbol"];
    [quesData setObject:[NSNumber numberWithInt:[[questionView getTempAns] intValue]] forKey:@"ans"];
    [quesData setObject:[NSNumber numberWithInt:correctInt] forKey:@"isCorrect"];
    
    return quesData;
}
@end
