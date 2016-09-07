//
//  GRBsafeKeyBoard.m
//  label
//
//  Created by marking on 16/8/15.
//  Copyright © 2016年 marking. All rights reserved.
//
#define KeyboardView_Frame CGRectMake(0, 0, 320, 260)
#define Num_FontSize 26
#define Char_FontSize 24
#define Small_FontSize 18
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height
#define KHeightScale ([UIScreen mainScreen].bounds.size.height / 568.0)
#define KeyBoardY [UIScreen mainScreen].bounds.size.height-(256*KHeightScale)
#define KeyBoardWidth [UIScreen mainScreen].bounds.size.width
#define num_w KeyBoardWidth/3
#define num_h 54
#import <Masonry/Masonry.h>
#import "GRBsafeKeyBoard.h"
#import "GRBPayPsdInputView.h"
#import "GRBResultPayView.h"
#import "UIColor+extention.h"
#import "GRBkeyTextField.h"

@interface GRBsafeKeyBoard()

//键盘基本视图
@property(nonatomic,strong)UIView * keyBoradView;
//安全提示label
@property (nonatomic,strong)UILabel * safeTipLabel;
@property(nonatomic,strong)NSArray *numArray;

@property (nonatomic, strong) GRBPayPsdInputView *pswInputView;

@property (nonatomic,strong)UILabel * numLabel;
@property(nonatomic,strong)UIView * inputBackView;
@property (nonatomic,strong) UIWindow * window;

@end

@implementation GRBsafeKeyBoard
{
    
    int count;
}



+(instancetype)keyBardAlloc{
    
    GRBsafeKeyBoard *instance = [[GRBsafeKeyBoard alloc] init];
    
    return instance;

}

-(NSMutableArray *)valueArray{
    if (_valueArray==nil) {
        _valueArray = [[NSMutableArray alloc]init];
    }
    return _valueArray;
}

-(UIView *)keyBoradView{
    if (_keyBoradView==nil) {
        self.keyBoradView = [[UIView alloc]initWithFrame:CGRectMake(0, [UIScreen mainScreen].bounds.size.height-256, KeyBoardWidth, 256)];
        
        self.keyBoradView.backgroundColor = [UIColor whiteColor];
        self.keyBoradView.userInteractionEnabled=YES;
        self.userInteractionEnabled = YES;
    }
    return _keyBoradView;
}




-(UIView *)GRB_showSafeNumKeyBoard{
    
    [self creatNewNumberKeyBoard];
       return self.keyBoradView;
    
}
/**
 *  弹出带有输入框的键盘
 */
+(instancetype)GRB_showSafeInputKeyBoard{
    GRBsafeKeyBoard* safe = [[GRBsafeKeyBoard alloc]init];
    safe.inputBackView = [[UIView alloc]initWithFrame:[UIScreen mainScreen].bounds];
    safe.inputBackView.backgroundColor=[UIColor colorWithRGBValue:0x000000 andAlpha:0.4];
    [[UIApplication sharedApplication].keyWindow addSubview:safe.inputBackView];
    [safe creatInputKeyBoard];
    
    return safe;
    
}


/**
 *  创建键盘
 */
-(void)creatNewNumberKeyBoard{
    
    //数组定义
    self.numArray = [[NSArray alloc]initWithObjects:@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"",@"0",@" ",nil];
    
    UIView * safeView = [[UIView alloc]init];
    safeView.backgroundColor = [UIColor whiteColor];
    [self.keyBoradView addSubview:safeView];
    [safeView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.keyBoradView.mas_centerX);
        make.top.equalTo(self.keyBoradView.mas_top);
        make.height.mas_equalTo(40);
        make.width.mas_equalTo(200);
    }];
    self.safeTipLabel = [[UILabel alloc]init];
    self.safeTipLabel.text = @"我的安全键盘";
    self.safeTipLabel.font = [UIFont systemFontOfSize:12];
    self.safeTipLabel.textColor = [UIColor colorWithRGBValue:0x999999 andAlpha:1.0];
    self.safeTipLabel.textAlignment = NSTextAlignmentCenter;
    [safeView addSubview:self.safeTipLabel];
    [self.safeTipLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(safeView.mas_centerY);
        make.centerX.equalTo(safeView.mas_centerX).offset(20);
        make.height.mas_equalTo(40);
        
    }];
        UIImageView * imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0.32*[UIScreen mainScreen].bounds.size.width,12, 15, 17)];
        [imageView setImage:[UIImage imageNamed:@"anquan"]];
        [safeView addSubview:imageView];
    [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(safeView.mas_centerY);
        make.right.equalTo(self.safeTipLabel.mas_left).offset(-10);
        make.height.mas_equalTo(17);
        make.width.mas_equalTo(15);
        
    }];
    for (int i=0; i<12; i++) {
        float kx ;
        float ky ;
        kx = 0 + i%3 * num_w;
        ky = 40 + i/3 * num_h;
        UIButton * keyButton= [UIButton buttonWithType:UIButtonTypeCustom];
        [keyButton setTag:(1000+i)];
        [keyButton setFrame:CGRectMake(kx, ky, num_w, num_h)];
        [keyButton setTitle:[self.numArray objectAtIndex:i] forState:UIControlStateNormal];
        keyButton.layer.borderWidth = 0.25;
        keyButton.layer.borderColor = [UIColor colorWithRGBValue:0xc8cace andAlpha:1.0].CGColor;
        keyButton.enabled = YES;
        if (i == 9) {

            
        } else if (i == 11){
            
            [keyButton setImage:[UIImage imageNamed:@"cross"] forState:UIControlStateNormal];
            [keyButton addTarget:self action:@selector(deleteValue) forControlEvents:UIControlEventTouchUpInside];
            
            
        } else {
            [keyButton addTarget:self action:@selector(keyValuePress:) forControlEvents:UIControlEventTouchUpInside];
            
            [keyButton.titleLabel setFont:[UIFont systemFontOfSize:26]];
            [keyButton setTitleColor:[UIColor colorWithRGBValue:0x000000 andAlpha:1.0] forState:UIControlStateNormal];
            
        }
        
        self.numLabel = [[UILabel alloc]initWithFrame:CGRectMake(100, SCREEN_HEIGHT*0.8, 100, 30)];
        
        [self.keyBoradView addSubview:self.numLabel];
        [self.keyBoradView addSubview:keyButton];
    
    }
    

}
/**
 *  密码键盘
 */
-(void)creatInputKeyBoard{
   
    [[NSNotificationCenter defaultCenter] postNotificationName:@"count" object:nil];
        self.window = [UIApplication sharedApplication].keyWindow;
        //数组定义
        self.resultView = [GRBResultPayView payView];
            self.resultView.frame = CGRectMake(0,[UIScreen mainScreen].bounds.size.height-456 ,KeyBoardWidth, 200);

        self.resultView.backgroundColor = [UIColor colorWithRGBValue:0xefeff3 andAlpha:1.0];
    
    [self.resultView.forgetPswBtn addTarget:self action:@selector(forgetPsw) forControlEvents:UIControlEventTouchUpInside];
    [self.resultView.closeBtn addTarget:self action:@selector(closeView) forControlEvents:UIControlEventTouchUpInside];
    //这样子创建的textfield 满6位自动删除全部
    self.textField= [[GRBkeyTextField alloc]initWithFrame:CGRectMake(100,SCREEN_HEIGHT*0.8, 100, 10)];
    self.textField.isPassWord =@"input";
    [self.textField becomeFirstResponder];
    [self.window addSubview:self.resultView];
    [self.resultView addSubview:self.textField];
    [self setPassWord];
  
    
}
-(void)forgetPsw{
    
    if(self.GRBsafeKeyForgetPassWord){
        self.GRBsafeKeyForgetPassWord();
    }
    [self GRB_endKeyBoard];
}
-(void)closeView{
    if (self.GRBsafeKeyClose) {
        self.GRBsafeKeyClose();
    }
    [self GRB_endKeyBoard];
}
/**
 *  退出键盘
 */
-(void)GRB_endKeyBoard{
    [self.inputBackView removeFromSuperview];
    [self.textField resignFirstResponder];
    [self.resultView removeFromSuperview];
    [self.safeTipLabel removeFromSuperview];
}

/**
 *  删除数字
 */
-(void)deleteValue{
    
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"KeyValueChange" object:nil];
    if (self.valueArray.count==6&&!self.numType) {
        
        [self.valueArray removeAllObjects];
        self.currentPosition = 0;
        
        NSMutableString *printStr2 = [[NSMutableString alloc] init];
        for(int i = 0; i < [self.valueArray count]; i++){
            [printStr2 appendFormat:@"%@", [self.valueArray objectAtIndex:i]];
            
        }
        
        if (self.GRBsafeKeyValue) {
            self.GRBsafeKeyValue(printStr2,self.currentPosition,GRBadd);
            
        }
        
    }else{
    if (self.currentPosition==0) {
        if (self.valueArray.count) {
            [self.valueArray removeObjectAtIndex:self.valueArray.count-1];
            NSMutableString *printStr2 = [[NSMutableString alloc] init];
            for(int i = 0; i < [self.valueArray count]; i++){
                [printStr2 appendFormat:@"%@", [self.valueArray objectAtIndex:i]];
            }
            [self.resultView.sonPutView setBlackRoundCount:printStr2.length];
            
            if (self.GRBsafeKeyValue) {
                self.GRBsafeKeyValue(printStr2,self.currentPosition,GRBdelete);
            }
            
        
        }

    }else{
    [self.valueArray removeObjectAtIndex:self.currentPosition-1];
        

    NSMutableString *printStr2 = [[NSMutableString alloc] init];
    for(int i = 0; i < [self.valueArray count]; i++){
        [printStr2 appendFormat:@"%@", [self.valueArray objectAtIndex:i]];
    }
        [self.resultView.sonPutView setBlackRoundCount:printStr2.length];

        if (self.GRBsafeKeyValue) {
        self.GRBsafeKeyValue(printStr2,self.currentPosition,GRBdelete);
    }

    }
    }

}


/**
 *  点击数字 将数字的内容传递给输入框
 *
 */

-(void)keyValuePress:(UIButton *)sender{
   
    
    if(self.valueArray.count==6){
        if (self.numType==1) {
            
            
        }else{
        [self.valueArray removeAllObjects];
        self.currentPosition = 0;
        [self.valueArray insertObject:sender.titleLabel.text atIndex:self.currentPosition];
        
        NSMutableString *printStr2 = [[NSMutableString alloc] init];
        for(int i = 0; i < [self.valueArray count]; i++){
            [printStr2 appendFormat:@"%@", [self.valueArray objectAtIndex:i]];
            
        }
        
        if (self.GRBsafeKeyValue) {
            self.GRBsafeKeyValue(printStr2,self.currentPosition,GRBadd);
            
        }
        }
    }else{
    //发送一个通知，获取当前的光标位置
    [[NSNotificationCenter defaultCenter] postNotificationName:@"KeyValueChange" object:nil];
    
    [self.valueArray insertObject:sender.titleLabel.text atIndex:self.currentPosition];
    
    NSMutableString *printStr2 = [[NSMutableString alloc] init];
    for(int i = 0; i < [self.valueArray count]; i++){
        [printStr2 appendFormat:@"%@", [self.valueArray objectAtIndex:i]];

    }
    
    if (self.GRBsafeKeyValue) {
        self.GRBsafeKeyValue(printStr2,self.currentPosition,GRBadd);
        
    }
  
    }

}
-(void)setNumType:(showNumType)numType{
    _numType = numType;
    
}
-(void)dealloc{
    NSLog(@"销毁对象");
}
-(void)setPassWord{
//    //放在下面保存数据
    __block typeof(self)Kself = self;
//
    self.textField.GRB_textFiledText=^(NSString * string){
        [Kself.resultView.sonPutView setBlackRoundCount:string.length];
        if (string.length==6) {
            
        
                    if (Kself.GRBsafeKeyFinish) {
                           
                            Kself.GRBsafeKeyFinish(string);
                            
                        }
        }
        
    };
    
    self.resultView.GRBReultPayClickCloseBtnBlock=^{
        [Kself GRB_endKeyBoard];
        
    };
    

}

@end
