//
//  questionData.m
//  Hard R
//
//  Created by Callum Beckwith on 24/03/2017.
//  Copyright © 2017 kilcal. All rights reserved.
//

#import "questionData.h"

@implementation questionData
int questionNumber = 1;

+(void)increaseQuestionNumber {
    questionNumber++;
}

+(int)getQuestion {
    return questionNumber;
}

+(void)storeTempQuestionData: (NSDictionary*)qData {
    NSUserDefaults *nd = [NSUserDefaults standardUserDefaults];
    [nd setObject:qData forKey:[NSString stringWithFormat:@"tempQ_%d", [self getQuestion]]];
    [nd synchronize];
    NSLog(@"question %d updated", [self getQuestion]);
}
+(NSDictionary*)getTempQuestionDataFromQuestion: (int)questionNumber {
    NSUserDefaults *nd = [NSUserDefaults standardUserDefaults];
    NSDictionary *quesData = [nd objectForKey:[NSString stringWithFormat:@"tempQ_%d", questionNumber]];
    return quesData;
}
+(NSMutableArray*)getCurrentQuizData {
    NSMutableArray *currentQuestionData = [[NSMutableArray alloc] init];
    
    for(int i = 1; i <= 10; i++){
        [currentQuestionData addObject:[self getTempQuestionDataFromQuestion:i]];
    }
    
    return currentQuestionData;
}
+(int)getCurrentCorectQuestions {
    
    int correctAnwsers = 0;
    
    for (int i = 0; i <= 9; i++) {
        NSDictionary *question = [[self getCurrentQuizData] objectAtIndex:i];
        NSNumber *correctNessLol = [question objectForKey:@"isCorrect"];
        int correctInt = [correctNessLol intValue];
        
        if(correctInt == 1){
            correctAnwsers++;
        }
    }
    
    return correctAnwsers;
}
+(void)resetQuestionNumber {
    questionNumber = 1;
}
@end
