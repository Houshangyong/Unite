//
//  DemoViewController.m
//  HSYRequestClass
//
//  Created by 123 on 14-5-20.
//  Copyright (c) 2014年 侯尚勇. All rights reserved.
//

#import "DemoViewController.h"
@interface DemoViewController ()
{
}
@property(nonatomic,retain)NSMutableArray *dataArray;

@end
@implementation DemoViewController
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self appearewithAnimation];
}
-(void)appearewithAnimation
{
    UIView *window=self.view;
    [CATransaction begin];
    [CATransaction setAnimationDuration:0.9];
    //缩小的动画
    CABasicAnimation *shrinkAnimation1=[CABasicAnimation animationWithKeyPath:@"transform.scale"];
    shrinkAnimation1.timingFunction=[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
    shrinkAnimation1.fromValue=[NSNumber numberWithFloat:0.0f];
    shrinkAnimation1.toValue=[NSNumber numberWithFloat:1.0f];
    //跳动的动画
    CAKeyframeAnimation *positionAnimation1=[CAKeyframeAnimation animationWithKeyPath:@"position"];
    //创建一个位置块
    CGMutablePathRef positonPaht=CGPathCreateMutable();
    //将位置块指向的选定图层
    CGPathMoveToPoint(positonPaht, NULL, window.layer.position.x, window.layer.position.y);
    //进行动画的位置块
    CGPathAddQuadCurveToPoint(positonPaht, NULL, window.layer.position.x, -window.layer.position.y,window.layer.position.x, window.layer.position.y);
    CGPathAddQuadCurveToPoint(positonPaht, NULL, window.layer.position.x, -window.layer.position.y*0.25,window.layer.position.x, window.layer.position.y);
    //CGPathAddQuadCurveToPoint(positonPaht, NULL, window.layer.position.x, -window.layer.position.y*0.5,window.layer.position.x, window.layer.position.y);
    CGPathAddQuadCurveToPoint(positonPaht, NULL, window.layer.position.x, -window.layer.position.y*0.75,window.layer.position.x, window.layer.position.y);
    positionAnimation1.path=positonPaht;
    positionAnimation1.timingFunction=[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
    //添加动画到图层
    // [window.layer addAnimation:fade forKey:@"fade"];
    [window.layer addAnimation:shrinkAnimation1 forKey:@"shrinkAnimation1"];
    [window.layer addAnimation:positionAnimation1 forKey:@"positionAnimation1"];
    [CATransaction commit];
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    //适配ios7
    if( (UIDeviceSystemVersion>=7.0))
    {
            self.edgesForExtendedLayout = UIRectEdgeNone;
        self.navigationController.navigationBar.translucent = NO;
    }
// Do any additional setup after loading the view from its nib.

  UILabel *la =   [Unite labelWithWidth:200 withLeft:0 withTop:0 withTitle:@"fljaklfhjakfhajkfhajkfhajkfhajkfhakjfhajkfhajkfhjkfghhjsfgewuyfgewufbgefafafnafjkafnjafnajkfnam,nfm,afnm,anfffffffffffffffa,nf,anfkanfknwafklafkljlfjklfjfkljlafjklfjwalfkjwafkljwfklwjfklfjklfjalfkjwfkljwaflkawjflwkfjwfkljwafklawjfklawjfklfjawklfjawlfkjwflkjffwklfjwfkljafklajwfklwjfwfkljawlfkjawfkljwafkljwfkl" titleFontSize:[UIFont systemFontOfSize:10] textColor:[UIColor redColor] backgroundColor:[UIColor blueColor] alignment:NSTextAlignmentLeft];
    [self.view addSubview:la];

}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
