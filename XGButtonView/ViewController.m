//
//  ViewController.m
//  XGButtonView
//
//  Created by user on 2017/5/2.
//  Copyright © 2017年 郭晓广. All rights reserved.
//

#import "ViewController.h"
#import "XGButtonView.h"
@interface ViewController ()<XGDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    XGButtonView * buttonView = [[XGButtonView alloc]initWithFrame:CGRectMake(0, 64, [UIScreen mainScreen].bounds.size.width, 100) ];
//    buttonView.userInteractionEnabled = NO;
    buttonView.delegate = self;
    [buttonView setButtonBTextColor:[UIColor redColor]
           setButtonBackGroundColor: [UIColor purpleColor]
                    setButtonHeight:49.5
                     setButtonSpace:15
                         setBtnFont:16];
    buttonView.dataArr = @[@"郭靖",@"郭大侠",@"啦啦啦",@"大哥大",@"小灵通",@"窗前明光",@"窗前明月光",@"窗前明月",@"窗前月光",@"窗明月光"];
    [self.view addSubview:buttonView];
}

-(void)didclickbutton:(UIButton *)button
{
    NSLog(@"%@",button.titleLabel.text);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
