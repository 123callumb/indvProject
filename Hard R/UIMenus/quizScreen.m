//
//  quizScreen.m
//  Hard R
//
//  Created by Callum Beckwith on 22/03/2017.
//  Copyright © 2017 kilcal. All rights reserved.
//

#import "quizScreen.h"
#import "quizSlide.h"

@implementation quizScreen

+(void)startQuiz: (UIView*)v {
    UIView *quizUI = [[UIView alloc] initWithFrame:CGRectMake(v.frame.size.width, 0, v.frame.size.width, v.frame.size.height)];
    UIImage *quizStartImage = [UIImage imageNamed:@"beginQuiz"];
    UIButton *quizFrame = [UIButton buttonWithType:UIButtonTypeCustom];
    
    [quizFrame setImage:quizStartImage forState:UIControlStateNormal];
    [quizFrame setFrame:v.frame];
    [quizFrame setImage:quizStartImage forState:UIControlStateHighlighted];
    [quizFrame addTarget:self action:@selector(onQuizStart:) forControlEvents:UIControlEventTouchUpInside];
    
    [quizUI addSubview:quizFrame];
    [v addSubview:quizUI];
    
    [UIView animateWithDuration:0.3 animations:^{
        [quizUI setFrame:v.frame];
    }];
}
+(void)onQuizStart:(id)sender {
    UIButton *startButton = (UIButton*)sender;
    UIView *v = [startButton superview];
    UIView *v1 = [v superview];
    
    [quizSlide generateSlide:v1];
    
    [UIView animateWithDuration:0.3 animations:^{
        [v setFrame:CGRectMake(-v.frame.size.width, 0, v.frame.size.width, v.frame.size.width)];
    } completion:^(BOOL finished){
        [v removeFromSuperview];
    }];
    

}
@end
