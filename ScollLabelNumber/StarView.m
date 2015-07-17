//
//  StarView.m
//  ScollLabelNumber
//
//  Created by 融通汇信 on 15/7/16.
//  Copyright (c) 2015年 融通汇信. All rights reserved.
//

#import "StarView.h"
#import "SliderLabelContainer.h"
@interface StarView ()
@property (nonatomic, strong) CAShapeLayer *progressLayer;
@property (nonatomic, strong) SliderLabelContainer *tensSliderContainer;
@property (nonatomic, strong) SliderLabelContainer *singleSliderContainer;
@end
@implementation StarView

- (instancetype)initWithFrame:(CGRect)frame
{
   self = [super initWithFrame:frame];
    self.tensSliderContainer = [[SliderLabelContainer alloc]initWithFrame:CGRectMake(self.center.x - 55,self.center.y - 30, 35, 60) type:TensDigitType];
    self.singleSliderContainer = [[SliderLabelContainer alloc]initWithFrame:CGRectMake(self.center.x - 20,self.center.y - 30, 35, 60) type:SingleDigitType];
    UILabel *lab = [[UILabel alloc]initWithFrame:CGRectMake(self.center.x + 15,self.center.y - 30, 40, 80)];
    lab.text = @"%";
    lab.textColor = [UIColor whiteColor];
    lab.font = [UIFont systemFontOfSize:50];
    [lab sizeToFit];
    self.backgroundColor = [UIColor clearColor];
    self.progressLayer = [[CAShapeLayer alloc]init];
    self.progressLayer.lineWidth = 2;
    self.progressLayer.fillColor = [UIColor colorWithRed:51/255.0 green:142/255.0 blue:248/255.0 alpha:1.0].CGColor;
    self.progressLayer.strokeColor = [UIColor colorWithRed:254/255.0 green:218/255.0 blue:10/255.0 alpha:1.0].CGColor;
    [self.layer addSublayer:self.progressLayer];

    self.imgView = [[UIImageView alloc]initWithFrame:CGRectMake(15.0f, 1104.0f, 60.0f, 20.0f)];
    _imgView.center = CGPointMake(CGRectGetWidth(self.bounds)/2.0, CGRectGetHeight(self.bounds)/2+50.0);

    [self addSubview:lab];
    [self addSubview:_imgView];
    [self addSubview:_tensSliderContainer];
    [self addSubview:_singleSliderContainer];
    return self;
}
- (void)startLoadNumber:(NSInteger)num
{
    NSInteger tensDigit = num / 10;
    NSInteger singleDigit = num % 10;
    [_tensSliderContainer scrollToNum:tensDigit];
    [_singleSliderContainer scrollToNum:singleDigit];
    [self startDrawCircleAnimation];
}

- (void)startDrawCircleAnimation
{
    CABasicAnimation *pathAnimation = [[CABasicAnimation alloc]init];
    pathAnimation.keyPath = @"strokeEnd";
    pathAnimation.fromValue = @0;
    pathAnimation.toValue = @1;
    pathAnimation.duration = 0.5;
    [_progressLayer addAnimation:pathAnimation forKey:@"pathAnimation"];
}
- (void)drawRect:(CGRect)rect
{
    UIColor *color = [UIColor redColor];
    [color set];
    
    CGFloat radius = CGRectGetWidth(self.bounds)/2.0f;
    CGPoint center = CGPointMake(radius, radius);
    CGFloat startAngle = -M_PI_2;
    CGFloat endAngle = M_PI_2 * 3.0;
    UIBezierPath *circlePath = [UIBezierPath bezierPathWithArcCenter:center radius:radius startAngle:startAngle endAngle:endAngle clockwise:YES];
    _progressLayer.path = circlePath.CGPath;
}
- (void)layoutSubviews
{
    [super layoutSubviews];

}
@end












