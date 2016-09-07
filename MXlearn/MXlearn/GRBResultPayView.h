//
//  GRBResultPayView.h
//  GuoRenBao
//
//  Created by 李炎 on 16/1/7.
//  Copyright © 2016年 LiYan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GRBPayPsdInputView.h"
@interface GRBResultPayView : UIView

// 需要弹出时调用的block
@property (nonatomic, copy) void(^GRBResultPayViewShowBlock)(GRBResultPayView *payView);
// 输入密码完成时调用的block
@property (nonatomic, copy) void(^GRBResultPayEndBlok)(GRBResultPayView *payView,NSString *passWord);
// 点击忘记密码时调用的block
@property (nonatomic, copy) void(^GRBReultPayForgetKeyBlock)();
// 点击关闭按钮block
@property (nonatomic, copy) void(^GRBReultPayClickCloseBtnBlock)();

// 输入支付密码的格子视图
@property (nonatomic, strong) GRBPayPsdInputView *sonPutView;
// 不显示的输入框，用来记录输入的字符
@property (nonatomic, strong) UITextField *unshowInputView;
// 关闭按钮
@property (nonatomic, strong) UIButton *closeBtn;
// 忘记密码按钮
@property (nonatomic, strong) UIButton *forgetPswBtn;

// 提示语句
@property (nonatomic, strong) UILabel *hintLabel;

//在哪个页面展示－－用于在删除银行卡的时候校验
@property(nonatomic,assign)NSInteger atVc;

+ (instancetype)payView;

- (void)showMePayView;


@end
