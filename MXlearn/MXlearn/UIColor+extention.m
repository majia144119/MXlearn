//
//  UIColor+extention.m
//  GuoRenBao
//
//  Created by 李炎 on 15/12/23.
//  Copyright © 2015年 LiYan. All rights reserved.
//

#import "UIColor+extention.h"

@implementation UIColor (extention)

/**
  根据 RGB 色值获得 UIColor
 */
+ (UIColor *)colorWithRGBValue:(NSUInteger)RGBValue andAlpha:(CGFloat)AlphaValue{
    
    CGFloat a = (CGFloat)(RGBValue / 0x10000);
    CGFloat b = (CGFloat)(RGBValue % 0x10000 / 0x100);
    CGFloat c = (CGFloat)(RGBValue % 0x100);
    
    return [UIColor colorWithRed:a/255.0 green:b/255.0 blue:c/255.0 alpha:AlphaValue];
}

@end
