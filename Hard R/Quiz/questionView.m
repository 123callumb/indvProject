//
//  questionView.m
//  Hard R
//
//  Created by Callum Beckwith on 23/03/2017.
//  Copyright © 2017 kilcal. All rights reserved.
//

#import "questionView.h"
#import "centerPoint.h"
#import "questionMarker.h"

@implementation questionView

NSString *tempAns;
int tempFirstNum;
int tempSecondNum;
NSString *tempSymbol;

+(void)createNewQuestion: (UIView*)v questionData:(NSDictionary*)ques {
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, -v.frame.size.height, v.frame.size.width, v.frame.size.height)];
    
    tempSymbol = [ques objectForKey:@"symbol"];
    float tileWidth = v.frame.size.width/6;
    float tileHeight = v.frame.size.height/12;
    
    UIImage *numberTile = [UIImage imageNamed:@"numberTile"];
    UIImageView *firstNumber = [[UIImageView alloc] initWithImage:numberTile];
    UIImageView *secondNumber = [[UIImageView alloc] initWithImage:numberTile];
    UIImage *symbolImage = [UIImage imageNamed:tempSymbol];
    UIImageView *symbolView = [[UIImageView alloc] initWithImage:symbolImage];
    
    UILabel *firstNumberLabel = [[UILabel alloc] initWithFrame:CGRectMake(tileWidth/80, 0, tileWidth, tileHeight)];
    UILabel *secondNumberLabel = [[UILabel alloc] initWithFrame:CGRectMake(tileWidth/80, 0,  tileWidth, tileHeight)];
    
    UIImage *anwserImage = [UIImage imageNamed:@"answerTitle"];
    UIImageView *answerTitle = [[UIImageView alloc] initWithFrame:CGRectMake(view.frame.size.width/3.8, view.frame.size.height/2.25, anwserImage.size.width/4, anwserImage.size.height/4)];
    UITextField *answerBox = [[UITextField alloc] initWithFrame:CGRectMake([centerPoint placeUIItemWithWidth:tileWidth onCenterOfWidth:v.frame.size.width] + v.frame.size.width/6, v.frame.size.height/2.275, tileWidth, tileHeight/1.25)];
    
    UIImage *doneImage = [UIImage imageNamed:@"doneButtonSmall"];
    UIButton *done = [UIButton buttonWithType:UIButtonTypeCustom];
    
    [answerTitle setImage:anwserImage];
    [answerBox setBackground:numberTile];
    [answerBox setFont:[UIFont fontWithName:@"ArialRoundedMTBold" size:20]];
    [answerBox setTextAlignment:NSTextAlignmentCenter];
    [answerBox addTarget:self action:@selector(onFieldValueChange:) forControlEvents:UIControlEventAllEditingEvents];
    [answerBox setKeyboardType:UIKeyboardTypeNumbersAndPunctuation];
    
    [symbolView setFrame:CGRectMake([centerPoint placeUIItemWithWidth:tileWidth onCenterOfWidth:v.frame.size.width], v.frame.size.height/3, tileWidth, tileHeight)];
    [firstNumber setFrame:CGRectMake([centerPoint placeUIItemWithWidth:tileWidth onCenterOfWidth:v.frame.size.width] - tileWidth, v.frame.size.height/3, tileWidth, tileHeight)];
    [secondNumber setFrame:CGRectMake([centerPoint placeUIItemWithWidth:tileWidth onCenterOfWidth:v.frame.size.width] + tileWidth, v.frame.size.height/3, tileWidth, tileHeight)];
    
    tempFirstNum = [(NSNumber*)[ques objectForKey:@"fistNum"] intValue];
    tempSecondNum = [(NSNumber*)[ques objectForKey:@"secondNum"] intValue]; 
    
    [firstNumberLabel setText:[NSString stringWithFormat:@"%d", tempFirstNum]];
    [secondNumberLabel setText:[NSString stringWithFormat:@"%d", tempSecondNum]];
    [firstNumberLabel setTextAlignment:NSTextAlignmentCenter];
    [secondNumberLabel setTextAlignment:NSTextAlignmentCenter];
    [firstNumberLabel setFont:[UIFont fontWithName:@"ArialRoundedMTBold" size:20]];
    [secondNumberLabel setFont:[UIFont fontWithName:@"ArialRoundedMTBold" size:20]];
    
    [done setImage:doneImage forState:UIControlStateNormal];
    [done setFrame:CGRectMake([centerPoint placeUIItemWithWidth:doneImage.size.width/3 onCenterOfWidth:v.frame.size.width], v.frame.size.height/1.9, doneImage.size.width/3, doneImage.size.height/3)];
    int anwserInt = [(NSNumber*)[ques objectForKey:@"answer"] intValue];
    [done setTag:1337+anwserInt];
    [done addTarget:self action:@selector(onDone:) forControlEvents:UIControlEventTouchUpInside];
    
    [firstNumber addSubview:firstNumberLabel];
    [secondNumber addSubview:secondNumberLabel];
    
    [view addSubview:done];
    [view addSubview:answerBox];
    [view addSubview:answerTitle];
    [view addSubview:symbolView];
    [view addSubview:firstNumber];
    [view addSubview:secondNumber];
    
    [v addSubview:view];
    
    [UIView animateWithDuration:0.3 animations:^{
        [view setFrame:v.frame];
    }];
}
+(void)onDone: (id)sender {
    UIButton *done = (UIButton*)sender;
    UIView *v = [done superview];
    UIView *v2 = [v superview];
    
    if(((int)done.tag - 1337) == [tempAns intValue]){
        NSLog(@"correct cunt");
        [questionMarker markQuestion:v2 correct:true];
    }else {
        NSLog(@"ye ye na na cunt");
        [questionMarker markQuestion:v2 correct:false];
    }

    [UIView animateWithDuration:0.3 animations:^{
        [v setFrame:CGRectMake(0, v.frame.size.height, v.frame.size.width, v.frame.size.height)];
    } completion:^(BOOL finished){
        [v removeFromSuperview];
    }];
    
}
+(void)onFieldValueChange: (UITextField*)sender {
    tempAns = sender.text;
}
+(void)resetQuestionTempVariables {
    tempAns = nil;
    tempFirstNum = 0;
    tempSecondNum = 0;
    tempSymbol = nil;
}
+(int)getTempFirstNumber {
    return tempFirstNum;
}
+(int)getTempSecondNumber {
    return tempSecondNum;
}
+(NSString*)getTempSymbol {
    return tempSymbol;
}
+(NSString*)getTempAns {
    return tempAns;
}
@end
