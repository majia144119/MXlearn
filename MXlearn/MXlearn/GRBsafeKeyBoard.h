//
//  GRBsafeKeyBoard.h
//  label
//
//  Created by marking on 16/8/15.
//  Copyright © 2016年 marking. All rights reserved.
//


typedef enum {
    GRBdelete,//删除字符串
    GRBadd //添加字符串
}HandleType;

typedef enum {
showNumTypeClear,//满6个自动删除全部   支付密码使用
showNumTypeKeep  //满6个一个一个删除   验证码使用

}showNumType;

#import <UIKit/UIKit.h>
#import "GRBResultPayView.h"
@class GRBkeyTextField;
@interface GRBsafeKeyBoard : UIView
//删除和添加数字使用
@property (nonatomic,copy)void(^GRBsafeKeyValue)(NSString *keyValue,NSInteger position,HandleType type);
//输入6位密码 完成
@property (nonatomic,copy)void(^GRBsafeKeyFinish)(NSString * passWord);
/**
 *  关闭按钮点击
 */
@property (nonatomic,copy)void(^GRBsafeKeyClose)();
/**
 *  点击忘记密码
 */
@property (nonatomic,copy)void(^GRBsafeKeyForgetPassWord)();
/**
 *  用来判断键盘退格的类型
 */
@property (nonatomic,assign)showNumType numType;
/**
 *  密码输入框
 */
@property(nonatomic ,strong)GRBResultPayView * resultView;
/**
 *  数组 用来保存按钮点击的数字
 */
@property (nonatomic,strong) NSMutableArray * valueArray;

//输入框光标的位置
@property (nonatomic,assign) NSInteger currentPosition;
/**
 *  自定义的textField
 */
@property (nonatomic,strong)GRBkeyTextField * textField;

//初始化方法
+(instancetype)keyBardAlloc;
//弹出数字键盘  为GRBkeyTextField使用
-(UIView *)GRB_showSafeNumKeyBoard;
/**
 *  弹出带密码输入框   （GRBkeyTextField无需任何操作即是安全数字键盘）
 *
 */
+(instancetype)GRB_showSafeInputKeyBoard;
/**
 *  退出键盘
 */
-(void)GRB_endKeyBoard;

@end
