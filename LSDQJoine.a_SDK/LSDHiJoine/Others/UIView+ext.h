//
//  UIView+ext.h
//  UIScrollViewDemo
//
//  Created by leehaiYang on 15/7/16.
//  Copyright (c) 2015年 com.lierda. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (ext)
@property (nonatomic, assign) CGFloat x;
@property (nonatomic, assign) CGFloat y;
@property (nonatomic, assign) CGFloat centerX;
@property (nonatomic, assign) CGFloat centerY;
@property (nonatomic, assign) CGFloat width;
@property (nonatomic, assign) CGFloat height;
@property (nonatomic, assign) CGSize size;
@property (nonatomic, assign) CGPoint origin;

- (void)updateFrame;
@end
