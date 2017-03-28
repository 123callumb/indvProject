//
//  questionData.h
//  Hard R
//
//  Created by Callum Beckwith on 24/03/2017.
//  Copyright © 2017 kilcal. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface questionData : NSObject
+(void)storeTempQuestionData: (NSDictionary*)qData;
+(void)increaseQuestionNumber;
+(int)getQuestion;
+(int)getCurrentCorectQuestions;
+(NSDictionary*)getTempQuestionDataFromQuestion: (int)questionNumber;
+(void)resetQuestionNumber;
+(NSMutableArray*)getCurrentQuizData;
@end
