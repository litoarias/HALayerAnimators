//
//  ViewController.m
//  TestChart
//
//  Created by Hipolito Arias on 3/7/16.
//  Copyright © 2016 Hipolito Arias. All rights reserved.
//

#import "ViewController.h"

#import "BarView.h"
#import "CircleView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    BarView *barView = [[BarView alloc] initWithFrame:CGRectMake(20,
                                                                 CGRectGetHeight(self.view.frame) - 200,
                                                                 20,
                                                                 100)];
    barView.strokeColor = [UIColor redColor];
    barView.dottedLine = NO;
    barView.lineWidth = 3;
    barView.animateDuration = 2;
    
    CircleView *circleView = [[CircleView alloc] initWithFrame:CGRectMake(140,
                                                                          CGRectGetHeight(self.view.frame) - 200,
                                                                          100,
                                                                          100)];
    circleView.strokeColor = [UIColor redColor];
    circleView.dottedLine = NO;
    circleView.lineWidth = 3;
    circleView.animateDuration = 2;
    
    
    [self.view addSubview:barView];
    [self.view addSubview:circleView];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
