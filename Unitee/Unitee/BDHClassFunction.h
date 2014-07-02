//
//  BDHClassFunction.h
//  Beidaihe
//
//  Created by MrXir on 13-5-28.
//  Copyright (c) 2013年 MrXir. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BDHClassFunction : UIViewController
+ (BDHClassFunction *)defaultFunctionManager;

- (UIView *)addLoadingDataAnimation;

- (void)ActivityIndicatorViewStartAnimation:(BOOL)start;

@end



//继承于 NSObject 方法
@interface NSObject (Object)

//添加标尺通用方法
- (void)creatMarkOn:(UIView *)me;
+ (BDHClassFunction *)defaultFunctionManager;

//创建按钮通用方法
- (UIButton *)orangeButtonWithNum:(NSUInteger)number Size:(NSUInteger)size Title:(NSString *)title;

@end

//继承于 UIViewController 方法
@interface UIViewController (ViewController)

//显示TabBar通用方法
- (void)showTabBarWithAnimationDuration:(CGFloat)durationTime;

//隐藏TabBar通用方法
- (void)hideTabBarWithAnimationDuration:(CGFloat)durationTime;
- (UITableView *)addTableView:(CGRect)frame Style:(UITableViewStyle)style Level:(BOOL)level Center:(CGPoint)center Name:(NSString *)name backgroundColor:(UIColor *)backgroundColor;

//创建框架通用方法
//- (void)creatFrameViewHasNavBar:(BOOL)hasNavBar HasTabBar:(BOOL)hasTabBar MarkMe:(BOOL)markMe;
- (UIView *)addLittleWhiteTriangle;
//- (void)leftButtonClickHandler:(id)sender;
- (void)back;
- (void)creatAlert;

@end