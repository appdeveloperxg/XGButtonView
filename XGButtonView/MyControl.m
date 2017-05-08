//
//  MyControl.m
//  Dome
//
//  Created by wangjiajia on 15/11/30.
//  Copyright © 2015年 wangjiajia. All rights reserved.
//

#import "MyControl.h"
//#import "AutoSize.h"


@implementation MyControl

#pragma mark - 创建UILabel
+(UILabel *)createLabelWithFrame:(CGRect)frame text:(NSString *)text font:(float)font textColor:(UIColor *)color textAlignment:(NSInteger)Alignment backgroundColor:(UIColor *)backgroundColor
{
    UILabel *label=[[UILabel alloc] initWithFrame:frame];
    label.text=text;
    if (color!=nil) {
       label.textColor=color;
    }
    label.numberOfLines=0;
    label.font=[UIFont systemFontOfSize:font];
    label.textAlignment=Alignment;
    if (backgroundColor) {
       label.backgroundColor=backgroundColor;
    }

    return label;
}
#pragma mark - 创建UIButton
+(UIButton *)creatButtonWithFrame:(CGRect)frame text:(NSString *)text font:(float)font textColor:(UIColor *)color  image:(NSString *)image backgroundColor:(UIColor *)backgroundColor radius:(float)radius target:(id)target method:(SEL)select
{
    UIButton *btn=[UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame=frame;
    [btn setTitle:text forState:UIControlStateNormal];
    [btn setTitleColor:color forState:UIControlStateNormal];
    if (image.length>1) {
        [btn setImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
    }
    if (backgroundColor) {
        btn.backgroundColor=backgroundColor;
    }
    if (radius) {
        btn.layer.cornerRadius=radius;
        btn.layer.masksToBounds=YES;
    }
    btn.titleLabel.font=[UIFont systemFontOfSize:font];
    [btn addTarget:target action:select forControlEvents:UIControlEventTouchUpInside];
    
    return btn;

}
#pragma mark - 创建UIimageView
+(UIImageView *)creatImageViewWithFrame:(CGRect)frame image:(NSString *)image radius:(float)radius
{
    UIImageView *imageView=[[UIImageView alloc] initWithFrame:frame];
    imageView.contentMode=UIViewContentModeScaleAspectFit;
    imageView.clipsToBounds=YES;
    if (image.length>1) {
        imageView.image=[UIImage imageNamed:image];
    }
    if (radius) {
        
        imageView.layer.cornerRadius=radius;
        imageView.layer.masksToBounds=YES;
    }
    
    return imageView;
}
#pragma  mark - 创建UIView
+(UIView *)creatViewWithFrame:(CGRect)frame backgroundColor:(UIColor *)backgroundColor radius:(float)radius
{

    UIView *view=[[UIView alloc] initWithFrame:frame];
    if (backgroundColor) {
        view.backgroundColor=backgroundColor;
    }
    if (radius) {
        view.layer.cornerRadius=radius;
        view.layer.masksToBounds=YES;
    }
    
    return view;
}
#pragma  mark - 创建UITextField
+(UITextField *)creatFieldWithFrame:(CGRect)frame placeholder:(NSString *)placeholder textColor:(UIColor *)textColor font:(float)font leftView:(UIView *)leftView rightView:(UIView *)rightView isPassWord:(BOOL)isPassWord
{
    
    
    UITextField *field=[[UITextField alloc] initWithFrame:frame];
    if (placeholder) {
        field.attributedPlaceholder=[[NSAttributedString alloc] initWithString:placeholder attributes:@{NSForegroundColorAttributeName:textColor,NSFontAttributeName:[UIFont systemFontOfSize:font]}];
    }
    if (textColor) {
        field.textColor=textColor;
    }
    if (leftView) {
        
        field.leftView=leftView;
        field.leftViewMode=UITextFieldViewModeAlways;
    }
    if (rightView) {
        field.rightView=rightView;
        field.rightViewMode=UITextFieldViewModeAlways;
    }
    if (font) {
        field.font=[UIFont systemFontOfSize:font];
    }
    if (isPassWord==YES) {
        field.secureTextEntry=YES;
        
    }

    return field;
}



@end
