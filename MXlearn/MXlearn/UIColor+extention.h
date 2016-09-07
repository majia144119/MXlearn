//
//  UIColor+extention.h
//  GuoRenBao
//
//  Created by 李炎 on 15/12/23.
//  Copyright © 2015年 LiYan. All rights reserved.
//

#import <UIKit/UIKit.h>


/***** 常用颜色 *****/

// 按钮
#define KColorBtnA 0x29ddb7     //绿色
#define KColorBtnB 0x6888d9     //蓝色浅
#define KColorBtnC 0x5977c5     //蓝色深
#define KColorBtnD 0xcccccc     //灰色浅
#define KColorBtnE 0x8c8c8c     //灰色深

//文字
#define KColorTextA0 0x181818   //灰色  从深到浅
#define KColorTextA1 0x333333
#define KColorTextA2 0x565656
#define KColorTextA3 0x777777
#define KColorTextA4 0x8c8c8c
#define KColorTextA5 0xcccccc
#define KColorTextA6 0xdddddd
#define KColorTextA7 0x999999   //浅灰色

#define kColorTextA8 0xffffff   //纯白色


#define KColorTextB0 0x6888d9   //蓝色 从深到浅
#define KColorTextB1 0xaabff5   //按钮不可点击时字的颜色

#define KColorTextC  0x1b9e19   //绿色

#define KColorTextD  0xff3b30   //红色



//背景
#define KColorBackgroundA0 0xdddddd     //灰色  从深到浅
#define KColorBackgroundA1 0xdfdff3
#define KColorBackgroundA2 0xf2f2f2 //所有内部页面的大灰底
#define KColorBackgroundA3 0xfafafa

//线
#define KColorLine0 0x8c8c8c    //灰色  从深到浅
#define KColorLine1 0xcccccc
#define KColorLine2 0xdddddd
#define KColorLine3 0xe5e5e5


@interface UIColor (extention)

/**
 根据 RGB 色值获得 UIColor
 */
+ (UIColor *)colorWithRGBValue:(NSUInteger)RGBValue andAlpha:(CGFloat)AlphaValue;
    

@end
