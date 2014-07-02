//
//  BDHClassFunction.m
//  Beidaihe
//
//  Created by MrXir on 13-5-28.
//  Copyright (c) 2013年 MrXir. All rights reserved.
//

#import "BDHClassFunction.h"

@implementation BDHClassFunction
{
    UIView *loadingViewBG;
    UIActivityIndicatorView *loadingView;
    UILabel * label;
}

/*
 Method implementation
 */

+ (BDHClassFunction *)defaultFunctionManager
{
    
    static BDHClassFunction *FunctionManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        FunctionManager = [[BDHClassFunction alloc] init];
    });
    return FunctionManager;
}

//添加加载数据动画
- (UIView *)addLoadingDataAnimation
{
    loadingViewBG = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 80, 60)];
    loadingViewBG.transform = CGAffineTransformMakeScale(0, 0);
    loadingViewBG.center = self.view.center;
    loadingViewBG.backgroundColor = [UIColor colorWithRed:0.551 green:0.592 blue:0.599 alpha:0.840];
    loadingViewBG.layer.cornerRadius = 8;
    loadingViewBG.layer.borderWidth = 1;
    loadingViewBG.layer.borderColor = [[UIColor colorWithRed:0.062 green:0.261 blue:0.386 alpha:0.770]CGColor];
    [self.view addSubview:loadingViewBG];
    
    loadingView = [[UIActivityIndicatorView alloc]initWithFrame:CGRectMake(0, 0, 80, 60)];
    [loadingView setTransform:CGAffineTransformMakeScale(2.0, 2.0)];
    loadingView.color = [UIColor whiteColor];
    [loadingViewBG addSubview:loadingView];
    
    return loadingViewBG;
}

- (void)ActivityIndicatorViewStartAnimation:(BOOL)start
{
    if (start)
    {
        
        [UIView animateWithDuration:0.5 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
            
            loadingViewBG.transform = CGAffineTransformMakeScale(1, 1);
            
        } completion:^(BOOL finished) {
            
            [loadingView startAnimating];
            
        }];
        
    }
    
    if (!start)
    {
        [UIView animateWithDuration:0.5 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
            
            loadingViewBG.transform = CGAffineTransformMakeScale(0, 0);
            
        } completion:^(BOOL finished) {
            
            [loadingView stopAnimating];
            
        }];
    }
    
    
}
@end


//继承于 NSObject 方法
@implementation NSObject (Object)
+ (BDHClassFunction *)defaultFunctionManager
{
    
    static BDHClassFunction *FunctionManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        FunctionManager = [[BDHClassFunction alloc] init];
    });
    return FunctionManager;
}

//添加标尺通用方法
- (void)creatMarkOn:(UIView *)me
{
    UILabel *markLabel = [[UILabel alloc]init];
    markLabel.frame = CGRectMake(0, me.frame.size.height - 16, me.frame.size.width, 16);
    markLabel.text = [NSString stringWithFormat:@"W:%3.0f H:%3.0f C:(%3.0f,%3.0f) - %@",me.frame.size.width,me.frame.size.height,me.center.x,me.center.y,me.accessibilityValue];
    markLabel.textAlignment = NSTextAlignmentCenter;
    markLabel.textColor = [UIColor orangeColor];
    markLabel.backgroundColor = [UIColor clearColor];
    if (me.frame.size.width < 150)
    {
        markLabel.text = [NSString stringWithFormat:@"W:%3.0f H:%3.0f - %@",me.frame.size.width,me.frame.size.height,me.accessibilityValue];
        markLabel.textColor = [UIColor whiteColor];
        markLabel.font = [UIFont systemFontOfSize:16.0f];
    }
    if (me.frame.size.width < 210.0f)
    {
        markLabel.font = [UIFont systemFontOfSize:11.0f];
    }
    else
    {
        markLabel.font = [UIFont systemFontOfSize:15.0f];
    }
    [me addSubview:markLabel];
    
    [markLabel release],markLabel = nil;
}

//创建按钮通用方法
- (UIButton *)orangeButtonWithNum:(NSUInteger)number Size:(NSUInteger)size Title:(NSString *)title
{
    CGFloat w = 0;
    CGFloat h = 0;
    CGFloat x = 0;
    CGFloat y = 0;
    UIButton *myButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [myButton setShowsTouchWhenHighlighted:YES];
    UILabel *label = [[UILabel alloc]init];
    label.font = [UIFont systemFontOfSize:20.0f];
    //按钮尺寸
    [myButton setTitleColor:[UIColor colorWithRed:0.912 green:0.413 blue:0.158 alpha:1.000] forState:UIControlStateNormal];
    if (size == 1)
    {
        w = 142.5,h = 98;
        [myButton setBackgroundImage:[UIImage imageNamed:[NSString stringWithFormat:@"main_0%lu.png",number - 10]] forState:UIControlStateNormal];
        [myButton setBackgroundImage:[UIImage imageNamed:[NSString stringWithFormat:@"main_0%lu.png",number - 10]] forState:UIControlStateHighlighted];
        myButton.frame = CGRectMake(0,0,w,h);
//        label.frame = CGRectMake(0, 0, w, h);
    }
    if (size == 2)
    {
        w = 142.5,h = 58;
        [myButton setBackgroundImage:[UIImage imageNamed:[NSString stringWithFormat:@"main_0%lu.png",number - 10]] forState:UIControlStateNormal];
        [myButton setBackgroundImage:[UIImage imageNamed:[NSString stringWithFormat:@"main_0%lu.png",number - 10]] forState:UIControlStateHighlighted];
        myButton.frame = CGRectMake(0,0,w,h);
        label.frame = CGRectMake(0, 0, w, h);
    }
//    if (size == 3)
//    {
//        w = 63,h = 50;
//        
//        [myButton setBackgroundImage:[UIImage imageNamed:@"little_normal.png"] forState:UIControlStateNormal];
//        
//        [myButton setBackgroundImage:[UIImage imageNamed:@"little_down.png"] forState:UIControlStateHighlighted];
//        
//        myButton.frame = CGRectMake(0,0,w,h);
//        
//        label.frame = CGRectMake(0,0,w,h);
//        
//    }
    
//    if (size == 3 && [title isEqualToString:@"投诉建议"])
//    {
//        label.frame = CGRectMake(5, 2, 53, 46);
//        label.backgroundColor = [UIColor greenColor];
//        label.numberOfLines = 2;
//        label.font = [UIFont systemFontOfSize:18.0f];
//    }
    switch (number)
    {
            //left
        case 11:
            x = 87.5 - 20,y = 175 - 118;
            break;
        case 12:
            x = 87.5 - 20,y = 255 - 118;
            break;
        case 13:
            x = 87.5 - 20,y = 315 - 118;
            break;
        case 14:
            x = 87.5 - 20,y = 375 - 118;
            break;
            //right
        case 15:
            x = 232.5 - 20,y = 155 - 118;
            break;
        case 16:
            x = 232.5 - 20,y = 235 - 118;
            break;
        case 17:
            x = 232.5 - 20,y = 315 - 118;
            break;
        case 241:
            x = 196 - 20,y = 395 - 118;
            break;
        case 18:
            x = 232.5 - 20,y = 375 - 118;
            break;
    }
    myButton.center = CGPointMake(x,y);
//    label.textAlignment = NSTextAlignmentCenter;
//    label.textColor = [UIColor colorWithRed:1.000 green:0.360 blue:0.149 alpha:1.000];
//    label.text = title;
//    label.backgroundColor = [UIColor clearColor];
//    [myButton addSubview:label];
//    [label release],label = nil;
    [label release];
    return myButton;
}
@end
//继承于 UIViewController 方法
@implementation UIViewController (ViewController)
//显示TabBar通用方法
- (void)showTabBarWithAnimationDuration:(CGFloat)durationTime
{
    UITabBar *tabBar = self.tabBarController.tabBar;
    UIView *parent = tabBar.superview; // UILayoutContainerView
    UIView *content = [parent.subviews objectAtIndex:0];  // UITransitionView
    UIView *window = parent.superview;
    [UIView animateWithDuration:durationTime
                     animations:^{
                         CGRect tabFrame = tabBar.frame;
                         tabFrame.origin.y = CGRectGetMaxY(window.bounds) - CGRectGetHeight(tabBar.frame);
                         tabBar.frame = tabFrame;
                         
                         CGRect contentFrame = content.frame;
                         contentFrame.size.height -= tabFrame.size.height;
                     }];
}
//隐藏TabBar通用方法
- (void)hideTabBarWithAnimationDuration:(CGFloat)durationTime
{
    UITabBar *tabBar = self.tabBarController.tabBar;
    UIView *parent = tabBar.superview; // UILayoutContainerView
    UIView *content = [parent.subviews objectAtIndex:0];  // UITransitionView
    UIView *window = parent.superview;
    [UIView animateWithDuration:durationTime
                     animations:^{
                         CGRect tabFrame = tabBar.frame;
                         tabFrame.origin.y = CGRectGetMaxY(window.bounds);
                         tabBar.frame = tabFrame;
                         content.frame = window.bounds;
                     }];
}
- (UIView *)addLittleWhiteTriangle
{
    UIView *animationView = [[UIImageView alloc]init];
    animationView.frame = CGRectMake(0, 0, 14, 6);
    animationView.center = CGPointMake(4, 53);
    animationView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"downico.png"]];
    animationView.transform = CGAffineTransformMakeRotation( 90 * M_PI  / 180);
    animationView.alpha = 1.0f;
    return animationView;
}
//创建一个可选水平的tableView
- (UITableView *)addTableView:(CGRect)frame Style:(UITableViewStyle)style Level:(BOOL)level Center:(CGPoint)center Name:(NSString *)name backgroundColor:(UIColor *)backgroundColor
{
    UITableView *myTableView = [[UITableView alloc]initWithFrame:frame style:style];
    myTableView.transform = CGAffineTransformMakeRotation(( 270 * M_PI  / 180) * level);
    myTableView.center = center;
    myTableView.accessibilityValue = name;
    myTableView.backgroundColor = backgroundColor;
    myTableView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"main_bg.png"]];
//    myTableView.separatorStyle = UITableViewCellSelectionStyleNone;
    myTableView.separatorColor = [UIColor colorWithWhite:0.797 alpha:0.860];
       return myTableView;
}
- (void)back
{
    [self.navigationController popViewControllerAnimated:YES];
    [[BDHClassFunction defaultFunctionManager] ActivityIndicatorViewStartAnimation:NO];
}
@end









