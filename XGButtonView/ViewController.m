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
@property (nonatomic ,strong)XGButtonView * buttonView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    _buttonView = [[XGButtonView alloc]initWithFrame:CGRectMake(0, 64, [UIScreen mainScreen].bounds.size.width, 100) ];
//    buttonView.userInteractionEnabled = NO;
    _buttonView.delegate = self;
    [_buttonView setButtonBTextColor:[UIColor redColor]
           setButtonBackGroundColor: [UIColor purpleColor]
                             setBtnY:42
                     setButtonHeight:49.5
                     setButtonSpace:15
                         setBtnFont:16];
    _buttonView.dataArr = @[@"郭靖",@"郭大侠",@"啦啦啦",@"大哥大",@"小灵通",@"窗前明光",@"窗前明月光",@"窗前明月",@"窗前月光",@"窗明月光"];
    [self.view addSubview:_buttonView];
}

-(void)didclickbutton:(UIButton *)button
{
    NSLog(@"%@",button.titleLabel.text);
    NSLog(@"%f",[_buttonView returnXGButtonViewHeightWithDataArr:@[@"郭靖",@"郭大侠",@"啦啦啦",@"大哥大",@"小灵通",@"窗前明光",@"窗前明月光",@"窗前明月",@"窗前月光",@"窗明月光"]]);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
