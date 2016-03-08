//
//  NSString+size.h
//  IntelligentBuilding
//
//  Created by leehaiYang on 15/7/23.
//  Copyright (c) 2015年 LSD_SDBU(传宁). All rights reserved.
//

#import <Foundation/Foundation.h>
#import <QuartzCore/QuartzCore.h>
#import <UIKit/UIKit.h>
@interface NSString (size)
-(CGSize)sizeWithFont:(UIFont *)font;
- (CGSize)sizeWithFont:(UIFont *)font maxSize:(CGSize)size;
@end
