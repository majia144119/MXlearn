//
//  GRBPayPsdInputView.m
//  GuoRenBao
//
//  Created by LiYan on 15/12/17.
//  Copyright © 2015年 LiYan. All rights reserved.
//

#import "GRBPayPsdInputView.h"
#import <Masonry/Masonry.h>
#import "UIColor+extention.h"
#define kSeparateLineColor  [UIColor colorWithRGBValue:0xe0e0e0 andAlpha:1]

#define kBlackRoundColor [UIColor blackColor]
#define kSeparateLineColor  [UIColor colorWithRGBValue:0xe0e0e0 andAlpha:1]

@interface GRBPayPsdInputView ()

// 五条分割线
@property (nonatomic, strong) NSArray *separateLines;
// 六个黑圆点
@property (nonatomic, strong) NSArray *blackRoundViews;

@end

@implementation GRBPayPsdInputView

// 设置圆点数量
- (void)setBlackRoundCount:(NSInteger)count {
    // 先隐藏所有圆点
   
    for (UIView *view in self.blackRoundViews) {
        view.hidden = YES;
    }
    // 遍历圆点
    [self.blackRoundViews enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if (idx < count) {
            ((UIView *)obj).hidden = NO;
        }
    }];
}

// 子视图布局
-(void)layoutSubviews {
    
    UIView *view0 = [self.separateLines objectAtIndex:0];
    UIView *view1 = [self.separateLines objectAtIndex:1];
    UIView *view2 = [self.separateLines objectAtIndex:2];
    UIView *view3 = [self.separateLines objectAtIndex:3];
    UIView *view4 = [self.separateLines objectAtIndex:4];
    // 布局分割线
    CGFloat halfCellWidth = self.bounds.size.width / 12;
    NSInteger lineIndex = [self.separateLines indexOfObject:view0];
    [view0 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left).offset(2 * halfCellWidth * lineIndex + 2 * halfCellWidth);
        make.right.equalTo(view0.mas_left).offset(0.5);
        make.top.equalTo(self.mas_top);
        make.bottom.equalTo(self.mas_bottom);
    }];
    lineIndex = [self.separateLines indexOfObject:view1];
    [view1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left).offset(2 * halfCellWidth * lineIndex + 2 * halfCellWidth);
        make.right.equalTo(view1.mas_left).offset(0.5);
        make.top.equalTo(self.mas_top);
        make.bottom.equalTo(self.mas_bottom);
    }];
    lineIndex = [self.separateLines indexOfObject:view2];
    [view2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left).offset(2 * halfCellWidth * lineIndex + 2 * halfCellWidth);
        make.right.equalTo(view2.mas_left).offset(0.5);
        make.top.equalTo(self.mas_top);
        make.bottom.equalTo(self.mas_bottom);
    }];
    lineIndex = [self.separateLines indexOfObject:view3];
    [view3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left).offset(2 * halfCellWidth * lineIndex + 2 * halfCellWidth);
        make.right.equalTo(view3.mas_left).offset(0.5);
        make.top.equalTo(self.mas_top);
        make.bottom.equalTo(self.mas_bottom);
    }];
    lineIndex = [self.separateLines indexOfObject:view4];
    [view4 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left).offset(2 * halfCellWidth * lineIndex + 2 * halfCellWidth);
        make.right.equalTo(view4.mas_left).offset(0.5);
        make.top.equalTo(self.mas_top);
        make.bottom.equalTo(self.mas_bottom);
    }];
    view0 = [self.blackRoundViews objectAtIndex:0];
    view1 = [self.blackRoundViews objectAtIndex:1];
    view2 = [self.blackRoundViews objectAtIndex:2];
    view3 = [self.blackRoundViews objectAtIndex:3];
    view4 = [self.blackRoundViews objectAtIndex:4];
    UIView *view5 = [self.blackRoundViews objectAtIndex:5];
    // 黑色小圆点布局
    NSInteger roundIndex = [self.blackRoundViews indexOfObject:view0];
    [view0 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.mas_left).offset(roundIndex * halfCellWidth * 2 + halfCellWidth);
        make.centerY.equalTo(self.mas_centerY);
        make.width.height.equalTo(self.mas_height).multipliedBy(0.24);
    }];
    roundIndex = [self.blackRoundViews indexOfObject:view1];
    [view1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.mas_left).offset(roundIndex * halfCellWidth * 2 + halfCellWidth);
        make.centerY.equalTo(self.mas_centerY);
        make.width.height.equalTo(self.mas_height).multipliedBy(0.24);
    }];
    roundIndex = [self.blackRoundViews indexOfObject:view2];
    [view2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.mas_left).offset(roundIndex * halfCellWidth * 2 + halfCellWidth);
        make.centerY.equalTo(self.mas_centerY);
        make.width.height.equalTo(self.mas_height).multipliedBy(0.24);
    }];
    roundIndex = [self.blackRoundViews indexOfObject:view3];
    [view3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.mas_left).offset(roundIndex * halfCellWidth * 2 + halfCellWidth);
        make.centerY.equalTo(self.mas_centerY);
        make.width.height.equalTo(self.mas_height).multipliedBy(0.24);
    }];
    roundIndex = [self.blackRoundViews indexOfObject:view4];
    [view4 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.mas_left).offset(roundIndex * halfCellWidth * 2 + halfCellWidth);
        make.centerY.equalTo(self.mas_centerY);
        make.width.height.equalTo(self.mas_height).multipliedBy(0.24);
    }];
    roundIndex = [self.blackRoundViews indexOfObject:view5];
    [view5 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.mas_left).offset(roundIndex * halfCellWidth * 2 + halfCellWidth);
        make.centerY.equalTo(self.mas_centerY);
        make.width.height.equalTo(self.mas_height).multipliedBy(0.24);
    }];
    
    self.backgroundColor = [UIColor whiteColor];
}

#pragma mark - 懒加载
// 分割线
-(NSArray *)separateLines {
    if (!_separateLines) {
        // 加载五条分割线
        UIView *view0 = [[UIView alloc] init];
                view0.backgroundColor = kSeparateLineColor;
        UIView *view1 = [[UIView alloc] init];
                view1.backgroundColor = kSeparateLineColor;
        UIView *view2 = [[UIView alloc] init];
                view2.backgroundColor = kSeparateLineColor;
        UIView *view3 = [[UIView alloc] init];
                view3.backgroundColor = kSeparateLineColor;
        UIView *view4 = [[UIView alloc] init];
                view4.backgroundColor = kSeparateLineColor;
        _separateLines = [[NSArray alloc] initWithObjects:view0, view1, view2, view3, view4, nil];
        [self addSubview:view0];
        [self addSubview:view1];
        [self addSubview:view2];
        [self addSubview:view3];
        [self addSubview:view4];
    }
    return _separateLines;
}

// 黑色圆点
-(NSArray *)blackRoundViews {
    if (!_blackRoundViews) {
        // 圆角半径
        CGFloat radius = self.bounds.size.height  * 0.24 / 2;
        // 加载六个小圆点
        UIView *view0 = [[UIView alloc] init];
                view0.backgroundColor = kBlackRoundColor;
        view0.layer.cornerRadius = radius;
        view0.layer.masksToBounds = YES;
        UIView *view1 = [[UIView alloc] init];
                view1.backgroundColor = kBlackRoundColor;
        view1.layer.cornerRadius = radius;
        view1.layer.masksToBounds = YES;
        UIView *view2 = [[UIView alloc] init];
                view2.backgroundColor = kBlackRoundColor;
        view2.layer.cornerRadius = radius;
        view2.layer.masksToBounds = YES;
        UIView *view3 = [[UIView alloc] init];
                view3.backgroundColor = kBlackRoundColor;
        view3.layer.cornerRadius = radius;
        view3.layer.masksToBounds = YES;
        UIView *view4 = [[UIView alloc] init];
                view4.backgroundColor = kBlackRoundColor;
        view4.layer.cornerRadius = radius;
        view4.layer.masksToBounds = YES;
        UIView *view5 = [[UIView alloc] init];
                view5.backgroundColor = kBlackRoundColor;
        view5.layer.cornerRadius = radius;
        view5.layer.masksToBounds = YES;
        _blackRoundViews = [[NSArray alloc] initWithObjects:view0, view1, view2, view3, view4, view5, nil];
        [self addSubview:view0];
        [self addSubview:view1];
        [self addSubview:view2];
        [self addSubview:view3];
        [self addSubview:view4];
        [self addSubview:view5];
        [self setBlackRoundCount:0];
    }
    return _blackRoundViews;
}

@end
