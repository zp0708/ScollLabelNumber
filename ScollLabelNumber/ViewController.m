//
//  ViewController.m
//  ScollLabelNumber
//
//  Created by 融通汇信 on 15/7/16.
//  Copyright (c) 2015年 融通汇信. All rights reserved.
//

#import "ViewController.h"
#import "SliderLabelContainer.h"
#import "StarView.h"

@interface ViewController ()
@property (nonatomic, strong) StarView *startView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.startView = [[StarView alloc]initWithFrame:CGRectMake(0, 0, 150, 150)];
    self.startView.center = CGPointMake(self.view.center.x, self.view.center.y);
    [self.startView.imgView setImage:[UIImage imageNamed:@"1122"]];

    [self.view addSubview:_startView];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    NSInteger num = arc4random_uniform(99);
    [self.startView startLoadNumber:num animation:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
