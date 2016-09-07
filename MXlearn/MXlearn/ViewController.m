//
//  ViewController.m
//  MXlearn
//
//  Created by marking on 16/9/7.
//  Copyright © 2016年 marking. All rights reserved.
//

#import "ViewController.h"
#import "GRBkeyTextField.h"
#import "GRBsafeKeyBoard.h"
#import "UIColor+extention.h"
#import <Masonry/Masonry.h>
@interface ViewController ()<GRBTextFieldDelegate>
@property(nonatomic,strong) GRBkeyTextField * safeTextField;
@property(nonatomic,strong) GRBkeyTextField * safeInputTextField;

@property(nonatomic,strong) GRBsafeKeyBoard * board;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self creatNewKeyBoard];
    [self creatNewInputKeyBoard];
}
/**
 *  创建一个数字键盘
 */
-(void)creatNewKeyBoard{
    self.safeTextField = [[GRBkeyTextField alloc]init];
    self.safeTextField.placeholder = @"我的数字键盘";
    //这句代码表示适用于 删除按钮一个个删除  否则满6位就全部清空
    [self.safeTextField GRB_creatSafeKeyBoard:self.safeTextField];
    //遵循代理主要是 键盘自适应
    self.safeTextField.GRB_delegate = self;
    self.safeTextField.font = [UIFont systemFontOfSize:16];
    [self.view addSubview:self.safeTextField];
    [self.safeTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view.mas_top).offset(200);
        make.centerX.equalTo(self.view.mas_centerX);
        make.height.mas_equalTo(40);
        make.width.mas_equalTo(200);
    }];
    
}

-(void)creatNewInputKeyBoard{
    UIButton * payBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    payBtn.backgroundColor = [UIColor colorWithRGBValue:0x6888d9 andAlpha:1.0];
    [payBtn setTitle:@"支付" forState:UIControlStateNormal];
    [payBtn addTarget:self action:@selector(payTo) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:payBtn];
    [payBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view.mas_top).offset(300);
        make.centerX.equalTo(self.view.mas_centerX);
        make.height.mas_equalTo(20);
        make.width.mas_equalTo(200);
    }];

}
-(void)payTo{
    self.board = [GRBsafeKeyBoard GRB_showSafeInputKeyBoard];
    __weak typeof(self)WS = self;
    self.board.GRBsafeKeyFinish=^(NSString * passWord){
        if (passWord.length==6) {
            
            [WS.board GRB_endKeyBoard];
            UIAlertController * alert = [UIAlertController alertControllerWithTitle:@"密码结果" message:passWord preferredStyle:UIAlertControllerStyleAlert];
            UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
            UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"好的" style:UIAlertActionStyleDefault handler:nil];
            [alert addAction:cancelAction];
            [alert addAction:okAction];
            [WS presentViewController:alert animated:YES completion:nil];

        }
        
    };
    self.board.GRBsafeKeyClose=^{
    
        [WS.board GRB_endKeyBoard];
    };
    
    self.board.GRBsafeKeyForgetPassWord=^{
        NSLog(@"点击忘记密码了");
        
    };
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
