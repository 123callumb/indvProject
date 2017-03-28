//
//  quizSlide.m
//  Hard R
//
//  Created by Callum Beckwith on 23/03/2017.
//  Copyright © 2017 kilcal. All rights reserved.
//

#import "quizSlide.h"
#import "questionView.h"
#import "questionGenerator.h"

@implementation quizSlide

+(void)generateSlide: (UIView*)v {
    [questionView createNewQuestion:v questionData:[questionGenerator generate]];
}

@end
