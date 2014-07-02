//
//  DefaultViewController.m
//  HSYApplicationFramework
//
//  Created by 123 on 14-6-20.
//  Copyright (c) 2014年 侯尚勇. All rights reserved.
//

#import "DefaultViewController.h"
#import "BDHClassFunction.h"
@interface DefaultViewController ()<UIScrollViewDelegate>
{
    int                    _lastPosition;
}
@end

@implementation DefaultViewController


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)scrollViewDidScroll:(UIScrollView *)scrollView

{
    int currentPostion = scrollView.contentOffset.y;
    if (currentPostion - _lastPosition > 20  && currentPostion > 0) {        //这个地方加上 currentPostion > 0 即可）
        _lastPosition = currentPostion;
        if (UIDeviceSystemVersion >=7.0) {
            self.tabBarController.tabBar.hidden = YES;
        }else{
            [self hideTabBarWithAnimationDuration:0.2];
        }
    }
    
    else if ((_lastPosition - currentPostion > 20) && (currentPostion  <= scrollView.contentSize.height-scrollView.bounds.size.height-20) ) //这个地方加上后边那个即可，也不知道为什么，再减20才行
    {
        _lastPosition = currentPostion;
        if (UIDeviceSystemVersion >=7.0) {
            self.tabBarController.tabBar.hidden = NO;
        }else{
            [self showTabBarWithAnimationDuration:0.2];
        }
    }
}
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate

{
    if (UIDeviceSystemVersion >=7.0) {
        self.tabBarController.tabBar.hidden = NO;
    }else{
        [self showTabBarWithAnimationDuration:0.2];
    }
    
}
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView

{
    //OK,真正停止了,do something
    if (UIDeviceSystemVersion >=7.0) {
        self.tabBarController.tabBar.hidden = NO;
    }else{
        [self showTabBarWithAnimationDuration:0.2];
    }
    
}

@end
