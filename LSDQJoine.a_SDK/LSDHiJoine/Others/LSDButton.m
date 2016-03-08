
//
//  LSDButton.m
//  IntelligentBuilding
//
//  Created by leehaiYang on 15/8/20.
//  Copyright (c) 2015年 LSD_SDBU(传宁). All rights reserved.
//

#import "LSDButton.h"
#import "UIView+ext.h"
#import "NSString+size.h"

@implementation LSDButton
- (void)layoutSubviews
{
    [super layoutSubviews];
//    CGFloat scale = [UIScreen mainScreen].scale;
    
    self.imageView.height = self.currentImage.size.height / 2;
    self.imageView.width = self.currentImage.size.width / 2;
    self.imageView.centerY = self.height / 2;
    self.imageView.x = 10;
    
    CGSize titleLabelSize = [self.titleLabel.text sizeWithFont:self.titleLabel.font];
    self.titleLabel.size = titleLabelSize;
    self.titleLabel.x = CGRectGetMaxX(self.imageView.frame);


}

//- (void)setTitle:(NSString *)title forState:(UIControlState)state
//{
//    [super setTitle:title forState:state];
//    
//    // 只要修改了文字，就让按钮重新计算自己的尺寸
//    [self sizeToFit];
//}
//
//- (void)setImage:(UIImage *)image forState:(UIControlState)state
//{
//    [super setImage:image forState:state];
//    
//    // 只要修改了图片，就让按钮重新计算自己的尺寸
//    [self sizeToFit];
//}

@end
