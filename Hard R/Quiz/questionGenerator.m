//
//  questionGenerator.m
//  Hard R
//
//  Created by Callum Beckwith on 23/03/2017.
//  Copyright © 2017 kilcal. All rights reserved.
//

#import "questionGenerator.h"
#import "randomNumber.h"

@implementation questionGenerator
+(NSDictionary*)generate {
    NSMutableDictionary *ques = [[NSMutableDictionary alloc] init];
    
    NSString *symbol = [self decideQuestionType];
    
    if([symbol isEqualToString:@"divideSymbol"]){
        [self createDivisableSum:ques];
    }else {
        [self createNonDivision:ques type:symbol];
    }
    
    return ques;
}

+(NSString*)decideQuestionType {
    int rnd = [randomNumber randomNumberBetween:1 maxNumber:4];
  
    if(rnd == 1){
        return @"subtractSymbol";
    }
    if(rnd == 2){
        return @"plusSymbol";
    }
    if(rnd == 3){
        return @"divideSymbol";
    }
    if(rnd == 4){
        return @"multiplySymbol";
    }
    else return nil;
}

+(void)createNonDivision: (NSMutableDictionary*)qData type:(NSString*)t {
    
    int hi;
    
    if([t isEqualToString:@"subtractSymbol"] || [t isEqualToString:@"plusSymbol"]){
        hi = 100;
    }else {
        hi = 10;
    }
    
    int firstNum = [randomNumber randomNumberBetween:1 maxNumber:hi];
    int secondNum = [randomNumber randomNumberBetween:1 maxNumber:hi];
    int ans = 0;
    
    if([t isEqualToString:@"subtractSymbol"]){
        ans = firstNum - secondNum;
    }
    if([t isEqualToString:@"plusSymbol"]){
        ans = firstNum + secondNum;
    }
    if([t isEqualToString:@"multiplySymbol"]){
        ans = firstNum * secondNum;
    }
    
    [qData setObject:[NSNumber numberWithInt:firstNum] forKey:@"fistNum"];
    [qData setObject:[NSNumber numberWithInt:secondNum] forKey:@"secondNum"];
    [qData setObject:[NSNumber numberWithInt:ans] forKey:@"answer"];
    [qData setObject:t forKey:@"symbol"];
}
+(void)createDivisableSum: (NSMutableDictionary*)qData {
    int firstNum = [randomNumber randomNumberBetween:1 maxNumber:10];
    int secondNum = [randomNumber randomNumberBetween:1 maxNumber:10];
    int ans = firstNum * secondNum;
    
    [qData setObject:[NSNumber numberWithInt:ans] forKey:@"fistNum"];
    [qData setObject:[NSNumber numberWithInt:secondNum] forKey:@"secondNum"];
    [qData setObject:[NSNumber numberWithInt:firstNum] forKey:@"answer"];
    [qData setObject:@"divideSymbol" forKey:@"symbol"];
    
}
@end
