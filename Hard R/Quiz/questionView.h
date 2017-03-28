//
//  questionView.h
//  Hard R
//
//  Created by Callum Beckwith on 23/03/2017.
//  Copyright © 2017 kilcal. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface questionView : UIView
+(void)createNewQuestion: (UIView*)v questionData:(NSDictionary*)ques;
+(void)resetQuestionTempVariables ;
+(int)getTempFirstNumber;
+(int)getTempSecondNumber;
+(NSString*)getTempSymbol;
+(NSString*)getTempAns;
@end
