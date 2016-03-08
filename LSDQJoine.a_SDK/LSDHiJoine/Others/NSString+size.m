//
//  NSString+size.m
//  IntelligentBuilding
//
//  Created by leehaiYang on 15/7/23.
//  Copyright (c) 2015年 LSD_SDBU(传宁). All rights reserved.
//

#import "NSString+size.h"

@implementation NSString (size)
-(CGSize)sizeWithFont:(UIFont *)font
{
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    dict[NSFontAttributeName] = font;
   return [self sizeWithAttributes:dict];
}
- (CGSize)sizeWithFont:(UIFont *)font maxSize:(CGSize)size
{
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    dict[NSFontAttributeName] = font;
    return [self boundingRectWithSize:size options:NSStringDrawingUsesFontLeading attributes:dict context:nil].size;
}
@end
