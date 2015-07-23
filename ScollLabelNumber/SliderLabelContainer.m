//
//  SliderLabelContainer.m
//  ScollLabelNumber
//
//  Created by 融通汇信 on 15/7/16.
//  Copyright (c) 2015年 融通汇信. All rights reserved.
//

#import "SliderLabelContainer.h"


@interface SliderLabelContainer ()
@property (nonatomic, strong) UIScrollView *singleDigitsScroll;
@property (nonatomic, assign) SliderLabelContainerType scrollType;
@end

@implementation SliderLabelContainer

- (instancetype)initWithFrame:(CGRect)frame type:(SliderLabelContainerType)type
{
    self.userInteractionEnabled = NO;
    self = [super initWithFrame:frame];
    self.scrollType = type;
    _singleDigitsScroll = [[UIScrollView alloc]initWithFrame:self.bounds];
    _singleDigitsScroll.contentSize = CGSizeMake(CGRectGetWidth(self.bounds), CGRectGetHeight(self.bounds)*10);
    for (int i = 0; i <= 10; i++) {
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, CGRectGetHeight(self.bounds) * (CGFloat)i, CGRectGetWidth(self.bounds), CGRectGetHeight(self.bounds))];
        label.text = [NSString stringWithFormat:@"%d",i];
        label.textAlignment = NSTextAlignmentCenter;
        label.font = [UIFont systemFontOfSize:CGRectGetHeight(self.bounds)];
        label.textColor = [UIColor whiteColor];
        [_singleDigitsScroll addSubview:label];
    }
    [self addSubview:_singleDigitsScroll];
    return self;
}

- (void)scrollToNum:(NSInteger)num animation:(BOOL)animation
{
    if (self.scrollType == SingleDigitType) {
        if (animation) {
            [UIView animateWithDuration:0.85 animations:^{
                self.singleDigitsScroll.contentOffset = CGPointMake(0, CGRectGetHeight(self.bounds) * (CGFloat)num);
            }];
        }else{
            self.singleDigitsScroll.contentOffset = CGPointMake(0, CGRectGetHeight(self.bounds) * (CGFloat)num);
        }
        
    }else{
        if (animation) {
            [UIView animateWithDuration:0.85 animations:^{
                self.singleDigitsScroll.contentOffset = CGPointMake(0, CGRectGetHeight(self.bounds) * (CGFloat)num);
            }];
        }else
        {
            self.singleDigitsScroll.contentOffset = CGPointMake(0, CGRectGetHeight(self.bounds) * (CGFloat)num);
            
        }
        
    }
}

@end
