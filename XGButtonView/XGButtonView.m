//
//  XGButtonView.m
//  热门标签的自动换行
//
//  Created by user on 16/5/24.
//  Copyright © 2016年 shrek. All rights reserved.
//

#import "XGButtonView.h"
#import "MyControl.h"
#define WORDSGRAYCOLOR [UIColor redColor]
#define WORDBLACKCOLOR [UIColor blueColor]
#define BtnH 49.5



@interface XGButtonView ()
@property (nonatomic,assign) CGFloat BtnY;

@end

@implementation XGButtonView
{
    NSMutableArray * dataArray;
}

-(instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
        [self addSubview:self.titleLable];
        _BtnY = 42;
        //创建button
    
//        self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, self.frame.size.width, self.height);
    //    self.backgroundColor = [UIColor yellowColor];
    }
    return self;
}
-(void)setDataArr:(NSArray *)dataArr
{
    NSArray * arr = [self subviews];
    for (UIView * view in arr) {
        
        [view removeFromSuperview];
    }
    [self addSubview:self.titleLable];
    
    dataArray = [[NSMutableArray alloc]init];
    self.backgroundColor = [UIColor clearColor];
    int width = 0;
    int height = 0;
    int number = 0;
    int han = 0;
    
    //创建button
    for (int i = 0; i < dataArr.count; i++) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.tag = 300 + i;
        [button setTitleColor:_buttonBTextColor forState:UIControlStateNormal];
        [button addTarget:self action:@selector(handleButton:) forControlEvents:UIControlEventTouchUpInside];
        
        
        CGSize titleSize = [dataArr[i] boundingRectWithSize:CGSizeMake(999, 25) options:NSStringDrawingTruncatesLastVisibleLine | NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:_btnFont]} context:nil].size;
        titleSize.width += _buttonSpace;
        static int hang = 0;
        //自动的折行
        han = han +titleSize.width+_buttonSpace;
        if (han > [[UIScreen mainScreen]bounds].size.width) {
            han = 0;
            han = han + titleSize.width;
            height++;
            hang++;
            width = 0;
            width = width+titleSize.width;
            number = 0;
            button.frame = CGRectMake(10, _BtnY +_buttonHeight*height, titleSize.width, _buttonHeight-15.5);
        }else{
            button.frame = CGRectMake(width+10+(number*10), _BtnY +_buttonHeight*height, titleSize.width, _buttonHeight-15.5);
            width = width+titleSize.width;
        }
        if (i==dataArr.count-1) {
            self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, self.frame.size.width,_BtnY +(height+1)*BtnH);
        }

        number++;
        button.titleLabel.font = [UIFont systemFontOfSize:_btnFont];
        button.layer.masksToBounds = YES;
        button.layer.cornerRadius = 4.0;
        button.backgroundColor = _buttonBackGroundColor;
        [button setTitle:dataArr[i] forState:UIControlStateNormal];
        [self addSubview:button];
    }
}
- (void)setButtonSpace:(CGFloat)buttonSpace
{
    _buttonSpace = buttonSpace;
}
-(void)setButtonHeight:(CGFloat)buttonHeight
{
    _buttonHeight = buttonHeight;
}
-(void)setButtonWidth:(CGFloat)buttonWidth
{
    _buttonWidth = buttonWidth;
}
-(void)setBtnFont:(CGFloat)btnFont
{
    _btnFont = btnFont;
}
-(void)setButtonBackGroundColor:(UIColor *)buttonBackGroundColor
{
    _buttonBackGroundColor = buttonBackGroundColor;
}
-(void)setButtonBTextColor:(UIColor *)buttonBTextColor
{
    _buttonBTextColor = buttonBTextColor;
}
-(void)setBtnY:(CGFloat)BtnY
{
    _BtnY = BtnY;
}
-(void)setButtonBTextColor:(UIColor *)buttonBTextColor
  setButtonBackGroundColor:(UIColor *)buttonBackGroundColor
                   setBtnY:(CGFloat)BtnY
           setButtonHeight:(CGFloat)buttonHeight
            setButtonSpace:(CGFloat)buttonSpace
                setBtnFont:(CGFloat)btnFont
{
    
    
    self.buttonBTextColor = buttonBTextColor;
    self.buttonBackGroundColor = buttonBackGroundColor;
    self.btnFont = btnFont;
    self.BtnY = BtnY;
    self.buttonSpace = buttonSpace;
    self.buttonHeight = buttonHeight;
    
    
}

- (void)handleButton:(UIButton *)button
{
    if ([self.delegate respondsToSelector:@selector(didclickbutton:)])
    {
        [self.delegate didclickbutton:button];
    }
    
}
-(UILabel *)titleLable
{
    if (!_titleLable) {
        _titleLable = [MyControl createLabelWithFrame:CGRectMake(15, 15, 200, 14) text:@"最近搜索" font:14 textColor:WORDSGRAYCOLOR textAlignment:0 backgroundColor:[UIColor clearColor]];
    }
    return _titleLable;
}
-(CGFloat)returnXGButtonViewHeightWithDataArr:(NSArray *)dataArr
{
    
    int width = 0;
    int height = 0;
    int number = 0;
    int han = 0;
    //创建button
    for (int i = 0; i < dataArr.count; i++) {
        
        
        CGSize titleSize = [dataArr[i] boundingRectWithSize:CGSizeMake(999, 25) options:NSStringDrawingTruncatesLastVisibleLine | NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:_btnFont]} context:nil].size;
        titleSize.width += _buttonSpace;
        static int hang = 0;
        //自动的折行
        han = han +titleSize.width+_buttonSpace;
        if (han > [[UIScreen mainScreen]bounds].size.width) {
            han = 0;
            han = han + titleSize.width;
            height++;
            hang++;
            width = 0;
            width = width+titleSize.width;
            number = 0;
        }else{
            width = width+titleSize.width;
        }
        if (i==dataArr.count-1) {
            return  _BtnY +(height+1)*BtnH;
        }
        
        number++;
    }
    return _BtnY +(height+1)*BtnH;
    
}
//- (void)handleButton:(UIButton *)button{
//    button.selected = !button.selected;
//    if (button.selected) {
//
//        NSLog(@"%f",button.frame.size.width);
//
//        float a=button.frame.size.width-12;
//
//        button.backgroundColor = [UIColor redColor];
//
//        UIImageView *imageView=[[UIImageView alloc]initWithFrame:CGRectMake(a, 30, 8, 8)];
//        imageView.backgroundColor=[UIColor yellowColor];
//        imageView.tag=10;
//        [dataArray addObject:[button currentTitle]];
//        [button addSubview:imageView];
//
//    }else{
//
//        button.backgroundColor = [UIColor lightGrayColor];
//        UIImageView *imageView=(UIImageView *)[button viewWithTag:10];
//        [dataArray removeObject:[button currentTitle]];
//        [imageView removeFromSuperview];
//    }
//    NSLog(@"dataArray===%@",dataArray);
//    if ([self.XGDelegate respondsToSelector:@selector(didclickbutton:)]) {
//        [self.XGDelegate didclickbutton:button];
//    }
//    if ([self.XGDelegate respondsToSelector:@selector(didEndtionalChooseButtonTitle:)]) {
//        [self.XGDelegate didEndtionalChooseButtonTitle:dataArray];
//    }
//}

@end
