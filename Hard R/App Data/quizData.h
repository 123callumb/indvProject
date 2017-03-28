//
//  quizData.h
//  Hard R
//
//  Created by Callum Beckwith on 23/03/2017.
//  Copyright © 2017 kilcal. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface quizData : NSObject
+(void)storeQuizDataForClass:(int)classNumber studentID:(NSString*)studentID quizResult:(NSArray*)quizResults score:(int)score;
+(NSMutableDictionary*)getQuizDataWithID: (int)quizID fromClass:(int)classNum;
+(NSMutableArray*)getClassData:(int)classNo ;

@end
