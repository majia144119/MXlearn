//
//  GRBResultPayView.m
//  GuoRenBao
//
//  Created by 李炎 on 16/1/7.
//  Copyright © 2016年 LiYan. All rights reserved.
//

#import "GRBResultPayView.h"
#import "GRBPayPsdInputView.h"
#import "UIColor+extention.h"
#import <Masonry/Masonry.h>

#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
@interface GRBResultPayView ()



// 标题
@property (nonatomic, strong) UILabel *titleLabel;

// 横线
@property (nonatomic, strong) UIView *hengLine;


@end


@implementation GRBResultPayView

+ (instancetype)payView {
    
    GRBResultPayView *instance = [[GRBResultPayView alloc] init];
    
    [instance setupUI];
    
    
    return instance;
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
}

// 加载控件
- (void)setupUI {
    
    // 密码输入框
    self.sonPutView = [[GRBPayPsdInputView alloc] init];
    self.sonPutView.layer.borderWidth = 0.5;
    self.sonPutView.layer.borderColor = [UIColor colorWithRGBValue:0x8c8c8c andAlpha:1.0].CGColor;
    [self addSubview:self.sonPutView];
    
    // 关闭按钮
    self.closeBtn = [[UIButton alloc] init];
    [self.closeBtn setImage:[UIImage imageNamed:@"wrong"] forState:UIControlStateNormal];
    [self addSubview:self.closeBtn];
    // 标题
    self.titleLabel = [[UILabel alloc] init];
    self.titleLabel.text = @"输入支付密码";
    self.titleLabel.textColor = [UIColor colorWithRGBValue:0x333333 andAlpha:1.0];
    self.titleLabel.font = [UIFont systemFontOfSize:16];
    [self addSubview:self.titleLabel];
    // 横线
    self.hengLine = [[UIView alloc] init];
    self.hengLine.backgroundColor = [UIColor colorWithRGBValue:0xdddddd andAlpha:1.0];
    [self addSubview:self.hengLine];
    // 忘记密码按钮
    self.forgetPswBtn = [[UIButton alloc] init];
    [self.forgetPswBtn setTitle:@"忘记密码？" forState:UIControlStateNormal];
    self.forgetPswBtn.titleLabel.font = [UIFont systemFontOfSize:14];
    [self.forgetPswBtn setTitleColor:[UIColor colorWithRGBValue:0x6888d9 andAlpha:1.0] forState:UIControlStateNormal];
    [self addSubview:self.forgetPswBtn];

    // 提示语句
    self.hintLabel = [[UILabel alloc] init];
    self.hintLabel.textColor = [UIColor colorWithRGBValue:0xff3b30 andAlpha:1];
    self.hintLabel.font = [UIFont systemFontOfSize:14];
    [self addSubview:self.hintLabel];
}

// 控件布局
- (void)layoutSubviews {
    
    [self.hengLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.sonPutView.mas_left);
        make.right.equalTo(self.sonPutView.mas_right);
        make.top.equalTo(self.mas_top).offset(50);
        make.height.mas_equalTo(0.5);
    }];

    
    [self.sonPutView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.hengLine.mas_bottom).offset(28);
        make.centerX.equalTo(self.mas_centerX);
//        make.centerY.equalTo(self.mas_centerY);
        make.width.mas_equalTo(SCREEN_WIDTH - 40);
        make.height.mas_equalTo(50);
     }];
     [self.closeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left).offset(18);
        make.bottom.equalTo(self.hengLine.mas_top).offset(-15);
    }];
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.mas_centerX);
        make.bottom.equalTo(self.hengLine).offset(-15);
    }];
    [self.forgetPswBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.sonPutView.mas_right);
        make.top.equalTo(self.sonPutView.mas_bottom).offset(18);
    }];
    [self.hintLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.hengLine.mas_left);
        make.bottom.equalTo(self.forgetPswBtn.mas_bottom);
        make.width.mas_equalTo(260);
        make.top.mas_equalTo(self.forgetPswBtn.mas_top);
    }];
}

@end



