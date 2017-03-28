//
//  quizData.m
//  Hard R
//
//  Created by Callum Beckwith on 23/03/2017.
//  Copyright © 2017 kilcal. All rights reserved.
//

#import "quizData.h"

@implementation quizData
+(void)storeQuizDataForClass:(int)classNumber studentID:(NSString*)studentID quizResult:(NSArray*)quizResults score:(int)score {
    //Inside the quizResult Array there is every question sotored in an nsdict
    //This ns dict contains the first num, the symbol, the secondnum, the ans, if it's correct or not.
    //So this needs to be comined with the student id and their score in a set class.
    
    NSMutableDictionary *studentQuizData = [[NSMutableDictionary alloc] init];
    
    NSData *quizToData = [NSKeyedArchiver archivedDataWithRootObject:quizResults];
    
    [studentQuizData setObject:quizToData forKey:@"quizData"];
    [studentQuizData setObject:studentID forKey:@"studentID"];
    NSLog(@"student ID added to dict");
    [studentQuizData setObject:[NSNumber numberWithInt:score] forKey:@"quizScore"];
    NSLog(@"score added to dict");

    [self addQuizData:studentQuizData classNo:classNumber];
    NSLog(@"Dict added to stored array with class number %d", classNumber);
}
+(NSMutableArray*)getClassData:(int)classNo {
    
    NSMutableArray *classArray;
    NSUserDefaults *nd = [NSUserDefaults standardUserDefaults];
    NSData *arrayToData = [nd objectForKey:[NSString stringWithFormat:@"class%dData", classNo]];

    
    if(arrayToData == nil){
        classArray = [[NSMutableArray alloc] init];
        arrayToData = [[NSData alloc] init];
    }
    
    classArray = [NSKeyedUnarchiver unarchiveObjectWithData:arrayToData];
    return classArray;
    
}
+(void)addQuizData: (NSMutableDictionary*)quizData classNo:(int)classNum {
    NSUserDefaults *nd = [NSUserDefaults standardUserDefaults];
    
    NSString *dataKey = [NSString stringWithFormat:@"class%dData", classNum];
    
    NSData *classNSData = [nd objectForKey:dataKey];
    NSLog(@"Ns data called from nsuserdefs");
    NSMutableArray *classD = [NSKeyedUnarchiver unarchiveObjectWithData:classNSData];
    NSLog(@"Data changed to array");

    if(classD == nil){
        classD = [[NSMutableArray alloc] init];
    }
    
    [classD addObject:quizData];
    NSLog(@"object added to array");

    NSData *arrayToData = [NSKeyedArchiver archivedDataWithRootObject:classD];
    NSLog(@"Array changed to data");

    [nd setObject:arrayToData forKey:dataKey];
    [nd synchronize];
    NSLog(@"Over rideded old data");

}
+(NSMutableDictionary*)getQuizDataWithID: (int)quizID fromClass:(int)classNum {
    NSUserDefaults *nd = [NSUserDefaults standardUserDefaults];
    NSData *classData = [nd objectForKey:[NSString stringWithFormat:@"class%dData", classNum]];
    NSMutableArray *classD = [NSKeyedUnarchiver unarchiveObjectWithData:classData];
    NSMutableDictionary *quizItem = [classD objectAtIndex:quizID];
    NSLog(@"Getting data for class %d and item at index %d", classNum, quizID);
    return quizItem;
}
@end
