//
//  MyControl.h
//  Dome
//
//  Created by wangjiajia on 15/11/30.
//  Copyright © 2015年 wangjiajia. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "FXBlurView.h"

@interface MyControl : NSObject

#pragma mark - 创建UILabel
+(UILabel *)createLabelWithFrame:(CGRect)frame text:(NSString *)text font:(float)font textColor:(UIColor *)color textAlignment:(NSInteger)Alignment backgroundColor:(UIColor *)backgroundColor;
#pragma mark - 创建UIButton
+(UIButton *)creatButtonWithFrame:(CGRect)frame text:(NSString *)text font:(float)font textColor:(UIColor *)color  image:(NSString *)image backgroundColor:(UIColor *)backgroundColor radius:(float)radius target:(id)target method:(SEL)select;
#pragma mark - 创建UIimageView
+(UIImageView *)creatImageViewWithFrame:(CGRect)frame image:(NSString *)image radius:(float)radius;
#pragma  mark - 创建UIView
+(UIView *)creatViewWithFrame:(CGRect)frame backgroundColor:(UIColor *)backgroundColor radius:(float)radius;
#pragma  mark - 创建UITextField
+(UITextField *)creatFieldWithFrame:(CGRect)frame placeholder:(NSString *)placeholder textColor:(UIColor *)textColor font:(float)font leftView:(UIView *)leftView rightView:(UIView *)rightView isPassWord:(BOOL)isPassWord;
#pragma mark - 给按钮添加下划线
///给按钮添加下划线
+(void)addUnderLineWithBtn:(UIButton *)btn withStr:(NSString *)Mystr withStrColor:(UIColor *)color;
#pragma mark - 设置label 文字的行间距
/// 设置label 文字的行间距
+(NSMutableAttributedString *)addLineSpaceWithString:(NSString *)string;
///设置文字首行缩进
+( NSAttributedString *)resetContentWith:(NSString *)title withOrginX:(float)left;
//根据图片大小和图片显示的视图矩形，计算并返回图片显示的矩形--普通视图
+(CGRect) getPicRectInWithSizeEasy:(CGSize)size frame:(CGRect)frameRect;

#pragma mark -返回多颜色字符串 str - 字符串 sep－ 分隔符 firstColor－第一种颜色secondColor － 第二种颜色
//返回多颜色字符串
+(NSMutableAttributedString*)getColorfulStringWithString:(NSString*)str separator:(NSString*)sep firstColor:(UIColor*)firstColor secondColor:(UIColor*)secondColor  withNormalFont:(float)normalFont withMaxFont:(float)maxFont;
#pragma mark - 搭建毛玻璃效果
+(FXBlurView *)creatFxBlurViewWithFrame:(CGRect)frame;
@end
