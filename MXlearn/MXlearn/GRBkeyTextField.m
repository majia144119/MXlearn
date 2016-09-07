//
//  GRBkeyTextField
//  label
//
//  Created by marking on 16/8/22.
//  Copyright © 2016年 marking. All rights reserved.
//

#import "GRBkeyTextField.h"
#import "GRBsafeKeyBoard.h"
#import "GRBResultPayView.h"
#import "GRBPayPsdInputView.h"

#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height


@interface GRBkeyTextField()<UITextFieldDelegate>
@property (nonatomic,strong)GRBsafeKeyBoard * key;

@end


@implementation GRBkeyTextField

- (void)deleteBackward {
//    ！！！这里要调用super方法，要不然删不了东西
    [super deleteBackward];
    
    if ([self.GRB_delegate respondsToSelector:@selector(GRBTextFieldDeleteBackward:)]) {
        [self.GRB_delegate GRBTextFieldDeleteBackward:self];
    }
}

-(instancetype)initWithFrame:(CGRect)frame{
   self= [super initWithFrame:frame];
    self.delegate = self;
    return self;
}

-(instancetype)init{
    self = [super init];
    self.delegate=self;
    return self;
}

-(void)textFieldDidBeginEditing:(UITextField *)textField{
    [self GRB_textFieldDidBeginEditing:self];
    
    if (SCREEN_HEIGHT-textField.frame.origin.y<420&&![self.isPassWord isEqualToString:@"input"]) {
        CGFloat floatText=420-(SCREEN_HEIGHT-textField.frame.origin.y);
        [UIView animateWithDuration:0.25 animations:^{
            textField.superview.transform = CGAffineTransformMakeTranslation(0, -floatText);
        }];
    }

}
//结束时 键盘回退
-(void)textFieldDidEndEditing:(UITextField *)textField{
    if (SCREEN_HEIGHT-textField.frame.origin.y<420||![self.isPassWord isEqualToString:@"input"]) {
        [UIView animateWithDuration:0.25 animations:^{
            textField.superview.transform = CGAffineTransformIdentity;
        }];
    }
}
-(BOOL)textFieldShouldBeginEditing:(UITextField *)textField{
    [self GRB_textFieldDidBeginEditing:self];
    NSLog(@"%@",textField);

    return YES;
}
-(void)GRB_textFieldDidBeginEditing:(GRBkeyTextField *)textField{
    if (self.key==nil) {
        self.key = [GRBsafeKeyBoard keyBardAlloc];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(changeValueKey) name:@"KeyValueChange" object:nil];
        textField.inputView=   [self.key GRB_showSafeNumKeyBoard];
        __block typeof(self)Kself = self;
        
        self.key.GRBsafeKeyValue=^(NSString * value,NSInteger position,HandleType type){
            
            textField.text = value;
            if (Kself.GRB_textFiledText) {
                Kself.GRB_textFiledText(textField.text);
            }
            switch (type) {
                case GRBadd:
                    [Kself getPosition:position withType:GRBadd];
                    
                    break;
                    
                case GRBdelete:
                    [Kself getPosition:position withType:GRBdelete];
                    
                    break;
            }
            
        };
      
        
        [self addSubview:self.key];
        
        
    }
}
-(instancetype)GRB_creatSafeKeyBoard:(GRBkeyTextField *)texts{

    if (texts) {
        if (texts.key==nil) {
            texts.key = [GRBsafeKeyBoard keyBardAlloc];
            [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(changeValueKey) name:@"KeyValueChange" object:nil];
            texts.key.numType = showNumTypeKeep;
            texts.inputView=   [texts.key GRB_showSafeNumKeyBoard];
            __block typeof(self)Kself = self;
            
            texts.key.GRBsafeKeyValue=^(NSString * value,NSInteger position,HandleType type){
                
                Kself.text = value;
                if (Kself.GRB_textFiledText) {
                    Kself.GRB_textFiledText(Kself.text);
                }
                switch (type) {
                    case GRBadd:
                        [Kself getPosition:position withType:GRBadd];
                        
                        break;
                        
                    case GRBdelete:
                        [Kself getPosition:position withType:GRBdelete];
                        
                        break;
                }
                
            };
            
            
            [self addSubview:texts.key];
            
            
        }
    }
    return texts;

}


-(void)backClear{
}
/**
 *  获取光标的位置
 */

-(void)changeValueKey{
    
    
    NSUInteger currentPosition =
    [self offsetFromPosition:self.beginningOfDocument
                            toPosition:self.selectedTextRange.start];
    self.key.currentPosition = currentPosition;

    
    
}

-(void)getPosition:(NSInteger)integer withType:(HandleType)type{
    UITextPosition *beginning = self.beginningOfDocument;
    // 重置光标位置
    if (type==GRBadd) {
        UITextPosition *now = [self positionFromPosition:beginning offset:integer+1];
        UITextRange *range = [self textRangeFromPosition:now toPosition:now];
        self.selectedTextRange = range;
    }else{
        UITextPosition *now = [self positionFromPosition:beginning offset:integer-1];
        UITextRange *range = [self textRangeFromPosition:now toPosition:now];
        self.selectedTextRange = range;
    }
    
    
}
@end
