//
//  MyControl.h
//  Dome
//
//  Created by wangjiajia on 15/11/30.
//  Copyright © 2015年 wangjiajia. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface MyControl : NSObject

#pragma mark - 创建UILabel
+(UILabel *)createLabelWithFrame:(CGRect)frame text:(NSString *)text font:(float)font textColor:(UIColor *)color textAlignment:(NSInteger)Alignment backgroundColor:(UIColor *)backgroundColor;
#pragma mark - 创建UIButton
+(UIButton *)creatButtonWithFrame:(CGRect)frame text:(NSString *)text font:(float)font textColor:(UIColor *)color  image:(NSString *)image backgroundColor:(UIColor *)backgroundColor radius:(float)radius target:(id)target method:(SEL)select;
#pragma mark - 创建UIimageView
+(UIImageView *)creatImageViewWithFrame:(CGRect)frame image:(NSString *)image radius:(float)radius;
#pragma  mark - 创建UIView
+(UIView *)creatViewWithFrame:(CGRect)frame backgroundColor:(UIColor *)backgroundColor radius:(float)radius;
@end
