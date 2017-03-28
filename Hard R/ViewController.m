//
//  ViewController.m
//  Hard R
//
//  Created by Callum Beckwith on 22/03/2017.
//  Copyright © 2017 kilcal. All rights reserved.
//

#import "ViewController.h"
#import "viewHandler.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor colorWithRed:65.0f/255.0f green:118.0/255.0f blue:171.0f/255.0f alpha:1]];
    // Do any additional setup after loading the view, typically from a nib.
    
    [viewHandler loadMenu:self.view];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
