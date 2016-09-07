//
//  GRBkeyTextField.h
//  label
//
//  Created by marking on 16/8/22.
//  Copyright © 2016年 marking. All rights reserved.
//

#import <UIKit/UIKit.h>
@class GRBkeyTextField;
@protocol GRBTextFieldDelegate <NSObject>
@optional

- (void)GRBTextFieldDeleteBackward:(GRBkeyTextField *)textField;

-(void)GRB_textFieldDidBeginEditing:(GRBkeyTextField *)textField;
@end
@interface GRBkeyTextField : UITextField
/**
 *  返回text的值
 */
@property (nonatomic, copy) void(^GRB_textFiledText)(NSString *text);
/**
 *  给个标记代表是否是密码输入键盘
 */
@property (nonatomic,copy)NSString * isPassWord;




@property (nonatomic, assign) id <GRBTextFieldDelegate> GRB_delegate;
-(instancetype)init;
-(instancetype)initWithFrame:(CGRect)frame;

/**
 *  给验证码使用的textfield
 *
 *  @param text textfield
 *
 */
-(instancetype)GRB_creatSafeKeyBoard:(GRBkeyTextField *)text;
@end
