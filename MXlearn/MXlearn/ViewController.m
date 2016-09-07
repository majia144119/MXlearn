//
//  ViewController.m
//  MXlearn
//
//  Created by marking on 16/9/7.
//  Copyright © 2016年 marking. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    UIButton * b = [[UIButton alloc]initWithFrame:CGRectMake(100, 200, 100, 30)];
    b.backgroundColor = [UIColor redColor];
    [self.view addSubview:b];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
