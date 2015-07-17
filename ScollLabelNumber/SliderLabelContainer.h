//
//  SliderLabelContainer.h
//  ScollLabelNumber
//
//  Created by 融通汇信 on 15/7/16.
//  Copyright (c) 2015年 融通汇信. All rights reserved.
//

#import <UIKit/UIKit.h>
enum SliderLabelContainerType{
    SingleDigitType,
    TensDigitType
};
typedef enum SliderLabelContainerType SliderLabelContainerType;
@interface SliderLabelContainer : UIView
- (instancetype)initWithFrame:(CGRect)frame type:(SliderLabelContainerType)type;
- (void)scrollToNum:(NSInteger)num;

@end
