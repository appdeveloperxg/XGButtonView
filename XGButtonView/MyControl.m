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
#pragma mark - 给按钮添加下划线
///给按钮添加下划线
+(void)addUnderLineWithBtn:(UIButton *)btn withStr:(NSString *)Mystr withStrColor:(UIColor *)color
{
    NSMutableAttributedString *attribute=[[NSMutableAttributedString alloc] initWithString:Mystr];
    [attribute addAttribute:NSUnderlineColorAttributeName value:[NSNumber numberWithInteger:NSUnderlineStyleSingle] range:NSMakeRange(0, Mystr.length)];
    [attribute addAttribute:NSForegroundColorAttributeName value:color range:NSMakeRange(0, Mystr.length)];
    [btn setAttributedTitle:attribute forState:UIControlStateNormal];
}
/// 设置label 文字的行间距
+(NSMutableAttributedString *)addLineSpaceWithString:(NSString *)string
{


    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:string];
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    
    [paragraphStyle setLineSpacing:4];//调整行间距
    
    [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [string length])];
   

    return attributedString;

}
///设置文字首行缩进
+( NSAttributedString *)resetContentWith:(NSString *)title withOrginX:(float)left
{
    
    NSMutableAttributedString *attributedString = [[ NSMutableAttributedString alloc ] initWithString :title];
    
    NSMutableParagraphStyle *paragraphStyle = [[ NSMutableParagraphStyle alloc ] init ];
    
    paragraphStyle. alignment = NSTextAlignmentLeft ;
    
    paragraphStyle. maximumLineHeight = 60 ;  //最大的行高
    
    paragraphStyle. lineSpacing = 5;  //行自定义行高度
    
    [paragraphStyle setFirstLineHeadIndent :left+15]; //首行缩进 根据用户昵称宽度在加5个像素
    [attributedString addAttribute : NSParagraphStyleAttributeName value :paragraphStyle range : NSMakeRange ( 0 , [title length])];
    
    return attributedString;
    //    [_desLable sizeToFit];
    
}
//根据图片大小和图片显示的视图矩形，计算并返回图片显示的矩形--普通视图
+(CGRect) getPicRectInWithSizeEasy:(CGSize)size frame:(CGRect)frameRect {
    CGRect rect = frameRect;
    if (size.height>0 && size.width>0) {
        
        float heightFactor = size.height/size.width;
        
        float width = frameRect.size.width;
        float height = frameRect.size.width * heightFactor;
        float top = (frameRect.size.height - height)/2;
        float left = 0;
        
        rect = CGRectMake(left, top, width, height);
    }
    
    return rect;
}
#pragma mark -返回多颜色字符串 str - 字符串 sep－ 分隔符 firstColor－第一种颜色secondColor － 第二种颜色
//返回多颜色字符串
+(NSMutableAttributedString*)getColorfulStringWithString:(NSString*)str separator:(NSString*)sep firstColor:(UIColor*)firstColor secondColor:(UIColor*)secondColor  withNormalFont:(float)normalFont withMaxFont:(float)maxFont{
    
    NSMutableAttributedString* strRet = [[NSMutableAttributedString alloc] initWithString:str];
    
    if (str != nil && sep != nil) {
        NSArray* arr = [str componentsSeparatedByString:sep];
        
        if (arr != nil && arr.count == 2) {
            NSString* str1 = arr[0];
            NSString *str2=arr[1];
            [strRet addAttribute:NSForegroundColorAttributeName value:firstColor range:NSMakeRange(0,str1.length)];
            [strRet addAttribute:NSForegroundColorAttributeName value: secondColor range:NSMakeRange(str1.length,str.length-str1.length)];
            [strRet addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:normalFont] range:NSMakeRange(str1.length+1,str2.length)];
            [strRet addAttribute:NSFontAttributeName value:[UIFont fontWithName:@"AdventPro-Light" size:maxFont] range:NSMakeRange(0,str1.length)];
        }
    }
    
    return  strRet;
}
+(FXBlurView *)creatFxBlurViewWithFrame:(CGRect)frame
{
    FXBlurView *blurView=[[FXBlurView alloc] initWithFrame:frame];
    blurView.blurRadius=15;
//    blurView.backgroundColor=[UIColor clearColor];
    blurView.dynamic=YES;
    blurView.blurEnabled=YES;
    blurView.tintColor=[UIColor clearColor];

    return blurView;
}




@end
