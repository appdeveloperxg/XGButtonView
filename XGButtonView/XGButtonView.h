//
//  XGButtonView.h
//  XGButtonView
//
//  Created by user on 2017/5/2.
//  Copyright © 2017年 郭晓广. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol XGDelegate <NSObject>

@optional

-(void)didclickbutton:(UIButton*)button;
-(void)didEndtionalChooseButtonTitle:(NSArray*)titleArr;

@end

@interface XGButtonView : UIView
@property (nonatomic ,strong) UILabel * titleLable;
@property(nonatomic,assign) id <XGDelegate> delegate;
@property(nonatomic,assign) CGFloat buttonWidth;
@property(nonatomic,assign) CGFloat buttonHeight;
@property(nonatomic,assign) CGFloat buttonSpace;
@property(nonatomic,strong) UIColor *buttonBackGroundColor;
@property(nonatomic,strong) UIColor *buttonBTextColor;


@property(nonatomic,assign) NSInteger height;
@property(nonatomic,strong) NSArray * dataArr;
@property(nonatomic,assign) CGFloat btnFont;
-(instancetype)initWithFrame:(CGRect)frame;

-(void)setButtonBTextColor:(UIColor *)buttonBTextColor
  setButtonBackGroundColor:(UIColor *)buttonBackGroundColor
           setButtonHeight:(CGFloat)buttonHeight
            setButtonSpace:(CGFloat)buttonSpace
                setBtnFont:(CGFloat)btnFont ;

@end
