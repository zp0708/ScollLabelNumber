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
    
    CGFloat singleW = self.frame.size.width * 0.20;
    CGFloat singleH = self.frame.size.height * 0.35;
    CGFloat singleX = 0;
    CGFloat singleY = 0;
    
    self.singleSliderContainer = [[SliderLabelContainer alloc]initWithFrame:CGRectMake(singleX,singleY, singleW, singleH) type:TensDigitType];
    self.singleSliderContainer.center = CGPointMake(self.center.x * 0.9, self.center.y);
    
    CGFloat tenX = _singleSliderContainer.frame.origin.x - singleW;
    CGFloat tenY = _singleSliderContainer.frame.origin.y;
    
    self.tensSliderContainer = [[SliderLabelContainer alloc]initWithFrame:CGRectMake(tenX,tenY,singleW, singleH) type:SingleDigitType];
    
    CGFloat persentX = _singleSliderContainer.frame.origin.x + singleW;
    CGFloat persentY = _singleSliderContainer.frame.origin.y;
    
    UILabel *lab = [[UILabel alloc]initWithFrame:CGRectMake(persentX,persentY, singleW * 1.5, singleH)];
    lab.text = @"%";
    lab.textColor = [UIColor whiteColor];
    lab.font = [UIFont systemFontOfSize:singleH * 0.9];
    
    self.backgroundColor = [UIColor clearColor];
    self.progressLayer = [[CAShapeLayer alloc]init];
    self.progressLayer.lineWidth = 2;
    self.progressLayer.fillColor = [UIColor colorWithRed:51/255.0 green:142/255.0 blue:248/255.0 alpha:1.0].CGColor;
    self.progressLayer.strokeColor = [UIColor colorWithRed:254/255.0 green:218/255.0 blue:10/255.0 alpha:1.0].CGColor;
    [self.layer addSublayer:self.progressLayer];
    
    self.imgView = [[UIImageView alloc]init];
    _imgView.bounds = CGRectMake(0, 0, self.frame.size.width * 0.3, singleH * 0.25);//CGSizeMake(self.frame.size.width * 0.3, singleH * 0.25);
    _imgView.center = CGPointMake(self.center.x, self.center.y + self.frame.size.height * 0.3);
    [_imgView setImage:[UIImage imageNamed:@"sy-yuanjiao"]];
    
    UILabel *textLbl = [[UILabel alloc]initWithFrame:_imgView.bounds];
    textLbl.text = @"年化利率";
    textLbl.textAlignment = NSTextAlignmentCenter;
    textLbl.font = [UIFont systemFontOfSize:singleH * 0.15];
    [_imgView addSubview:textLbl];
    textLbl.textColor = [UIColor whiteColor];
    
    [self addSubview:lab];
    [self addSubview:_imgView];
    [self addSubview:_tensSliderContainer];
    [self addSubview:_singleSliderContainer];
    return self;
}
- (void)startLoadNumber:(NSInteger)num animation:(BOOL)animation
{
    NSInteger tensDigit = num / 10;
    NSInteger singleDigit = num % 10;
    [_tensSliderContainer scrollToNum:tensDigit animation:animation];
    [_singleSliderContainer scrollToNum:singleDigit animation:animation];
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
@end












