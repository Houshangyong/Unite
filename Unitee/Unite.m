//
//  Unite.m
//  HSYApplicationFramework
//
//  Created by 123 on 14-6-18.
//  Copyright (c) 2014年 侯尚勇. All rights reserved.
//

#import "Unite.h"
#import <CommonCrypto/CommonCryptor.h>
#import "GTMBase64.h"
#define kLocaleIdentifier @"en_US"
@implementation Unite

/*
 AppDelegate
 */
+ (AppDelegate *)applicationDelegate
{
    return (AppDelegate *)[[UIApplication sharedApplication] delegate];
}

#pragma mark
#pragma mark - 利用正则表达式验证邮箱的合法性
+(BOOL)isValidateEmail:(NSString *)email {
    
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:email];
    
}
#pragma mark
#pragma mark - 利用正则表达式验证手机号合法性
+ (BOOL)isValidatePhone:(NSString *)phone
{
    //1[0-9]{10}
    //^((13[0-9])|(15[^4,\\D])|(18[0,5-9]))\\d{8}$
    //    NSString *regex = @"[0-9]{11}";
    //    if ([pred evaluateWithObject:str1] == NO) {
    //        [HSYProgressHUD showSuccessWithStatus:@"请输入正确的手机号" duration:2.0];
    //        return NO;
    //    }
    NSString *regex = @"^((13[0-9])|(147)|(15[^4,\\D])|(18[0,5-9]))\\d{8}$";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    return [pred evaluateWithObject:phone];
}
#pragma mark
#pragma mark - 根据要显示的文字以及UILable本身的字体，来计算能够完全显示所有文字的label所需要的大小，从而进行调整
+ (UILabel *)labelWithWidth:(CGFloat)width withLeft:(CGFloat)leftX withTop:(CGFloat)topy withTitle:(NSString *)title titleFontSize:(UIFont *)font textColor:(UIColor *)color backgroundColor:(UIColor *)bgColor alignment:(NSTextAlignment)textAlignment;
{

    UILabel *label = [[UILabel alloc] initWithFrame:CGRectZero];
    
    label.textColor = color;
    label.backgroundColor = bgColor;
    label.textAlignment = textAlignment;
    label.font = font;
    NSString *theText = title;
    label.text = theText;

    CGSize size =CGSizeMake(width,1000000);
    label.numberOfLines = 0;


    if (UIDeviceSystemVersion >= 7.0) {
        
        //高度估计文本大概要显示几行，宽度根据需求自己定义。 MAXFLOAT 可以算出具体要多高
        // label可设置的最大高度和宽度
        //    CGSize size = CGSizeMake(300.f, MAXFLOAT);
        //    获取当前文本的属性
        NSDictionary * tdic = [NSDictionary dictionaryWithObjectsAndKeys:font,NSFontAttributeName,nil];

        //ios7方法，获取文本需要的size，限制宽度
        
        CGSize  actualsize =[theText boundingRectWithSize:size options:NSStringDrawingUsesLineFragmentOrigin  attributes:tdic context:nil].size;
        
        // ios7之前使用方法获取文本需要的size，7.0已弃用下面的方法。此方法要求font，与breakmode与之前设置的完全一致
        //    CGSize actualsize = [tstring sizeWithFont:font constrainedToSize:size lineBreakMode:NSLineBreakByCharWrapping];
        //   更新UILabel的frame
        

        label.frame =CGRectMake(leftX,topy, actualsize.width, actualsize.height);

    }else{

    CGSize theStringSize = [theText sizeWithFont:font
                               constrainedToSize:size
                                   lineBreakMode:NSLineBreakByCharWrapping];

    //Adjust the size of the UILable
    label.frame = CGRectMake(leftX,
                             topy,
                             theStringSize.width, theStringSize.height);
    }
    return [label autorelease];
}
#pragma mark
#pragma mark -UIImageView
+ (UIImageView *)imageViewWithFrame:(CGRect)frame withImage:(UIImage *)image{
    
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:frame];
    imageView.image = image;
    return [imageView autorelease];
}
#pragma mark
#pragma mark -UIButton
+(UIButton *)createBtnWithType:(UIButtonType)btnType frame:(CGRect)btnFrame backgroundColor:(UIColor*)bgColor title:(NSString *)title titleColor:(UIColor*)TCColor Image:(UIImage *)btnImage backgroundImage:(UIImage *)bgImage state:(UIControlState)btnState;


{
    UIButton *btn = [UIButton buttonWithType:btnType];
    btn.frame = btnFrame;
    [btn setTitle:title forState:btnState];
    [btn setTitleColor:TCColor forState:btnState];
    [btn setImage:btnImage forState:btnState];
    [btn setBackgroundImage:bgImage forState:btnState];
    [btn setBackgroundColor:bgColor];
    return btn;
}
#pragma mark
#pragma mark -UIAlertView
+(UIAlertView *)alertTitle:(NSString *)title message:(NSString *)msg delegate:(id)aDeleagte cancelBtn:(NSString *)cancelName otherBtnName:(NSString *)otherbuttonName{
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:title message:msg delegate:aDeleagte cancelButtonTitle:cancelName otherButtonTitles:otherbuttonName, nil];
    [alert show];
    return [alert autorelease];
}
#pragma mark
#pragma mark -校验用户生日
+ (BOOL) validateUserBornDate : (NSString *) UserBornDate
{
    
    NSString *patternStr = @"^((((1[6-9]|[2-9]\d)\d{2})-(0?[13578]|1[02])-(0?[1-9]|[12]\d|3[01]))|(((1[6-9]|[2-9]\d)\d{2})-(0?[13456789]|1[012])-(0?[1-9]|[12]\d|30))|(((1[6-9]|[2-9]\d)\d{2})-0?2-(0?[1-9]|1\d|2[0-8]))|(((1[6-9]|[2-9]\d)(0[48]|[2468][048]|[13579][26])|((16|[2468][048]|[3579][26])00))-0?2-29-))$";
    NSRegularExpression *regularexpression = [[NSRegularExpression alloc]
                                              initWithPattern:patternStr
                                              options:NSRegularExpressionCaseInsensitive
                                              error:nil];
    NSUInteger numberofMatch = [regularexpression numberOfMatchesInString:UserBornDate
                                                                  options:NSMatchingReportProgress
                                                                    range:NSMakeRange(0, UserBornDate.length)];
    
    [regularexpression release];
    
//    if(numberofMatch > 0)
//    {
//        NSLog(@"%@ isNumbericString: YES", str);
//        return YES;
//    }
//    
//    NSLog(@"%@ isNumbericString: NO", str);
//    return NO;
    return numberofMatch;
}
#pragma mark
#pragma mark -校验用户密码
+ (BOOL) validateUserPasswd : (NSString *) UserPasswd
{
    
    NSRegularExpression *regularexpression = [[NSRegularExpression alloc]
                                              initWithPattern:@"^[a-zA-Z0-9]{6,16}$"
                                              options:NSRegularExpressionCaseInsensitive
                                              error:nil];
    NSUInteger numberofMatch = [regularexpression numberOfMatchesInString:UserPasswd
                                                                  options:NSMatchingReportProgress
                                                                    range:NSMakeRange(0, UserPasswd.length)];
    
    [regularexpression release];
    
//    if(numberofMatch > 0)
//    {
//        NSLog(@"%@ isNumbericString: YES", str);
//        return YES;
//    }
//    
//    NSLog(@"%@ isNumbericString: NO", str);
//    return NO;
    return numberofMatch;
}
#pragma mark
#pragma mark -车牌号
+ (BOOL) validateCarNo:(NSString *)carNo;
{
    NSString *carRegex = @"^[\u4e00-\u9fa5]{1}[a-zA-Z]{1}[a-zA-Z_0-9]{4}[a-zA-Z_0-9_\u4e00-\u9fa5]$";
    NSPredicate *carTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",carRegex];
    NSLog(@"carTest is %@",carTest);
    return [carTest evaluateWithObject:carNo];
}
#pragma mark
#pragma mark -身份证号
+ (BOOL) validateIdentityCard: (NSString *)identityCard
{
    //            身份证为15位或者18位，15位的全为数字，18位的前17位为数字，最后一位为数字或者大写字母”X“。
    //            与之匹配的正则表达式：(^\d{15}$)|(^\d{17}([0-9]|X)$)
   NSString * phoneRegex = @"(^\\d{15}$)|(^\\d{17}([0-9]|X)$)";
    NSPredicate *phoneTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@" , phoneRegex];
    return [phoneTest evaluateWithObject:identityCard];
}
#pragma mark
#pragma mark -军官证
+ (BOOL)isValidateIdcard:(NSString *)idCard
{
      NSString *phoneRegex=@"政字第(\\d{8})号";
    NSPredicate *phoneTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@" , phoneRegex];
    return [phoneTest evaluateWithObject:idCard];
}
#pragma mark
#pragma mark -护照
+ (BOOL)isValidateIdPassPortCard:(NSString *)passportCard;
{
    //        护照号码格式：
    //        因私普通护照号码格式有:14/15+7位数,G+8位数；因公普通:P.+7位数；
    //        公务：S.+7位数 或者 S+8位数,D开头外交护照.D=diplomatic
    NSString *phoneRegex=@"^(P\\d{7}|G\\d{8}|S\\d{7,8}|D\\d+|1[4,5]\\d{7})$";
    NSPredicate *phoneTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@" , phoneRegex];
    return [phoneTest evaluateWithObject:passportCard];
}
#pragma mark
#pragma mark -车型
+ (BOOL) validateCarType:(NSString *)CarType
{
    NSString *CarTypeRegex = @"^[\u4E00-\u9FFF]+$";
    NSPredicate *carTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",CarTypeRegex];
    return [carTest evaluateWithObject:CarType];
}
#pragma mark
#pragma mark -用户名
+ (BOOL) validateUserName:(NSString *)name
{
    NSString *userNameRegex = @"^[A-Za-z0-9]{6,20}+$";
    NSPredicate *userNamePredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",userNameRegex];
    BOOL B = [userNamePredicate evaluateWithObject:name];
    return B;
}
#pragma mark
#pragma mark -时间比较
+(BOOL) appointmentTime:(NSString *)appointmentTime;
{
    // 设定 日期格式
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy'-'MM'-'dd' 'HH':'mm':'ss'"];
    
    // 获取 现在时刻
    NSDate *thePresentMoment = [NSDate date];
    
    // 获取 预约时间
    NSDate *theAppointmentTime = [dateFormatter dateFromString:appointmentTime];
    
    // 输出现在时间
    NSString *now = [dateFormatter stringFromDate:thePresentMoment];
    NSLog(@"现在时刻:%@",now);
    
    // 输出预约时间
    NSString *theTime = [dateFormatter stringFromDate:theAppointmentTime];
    NSLog(@"预约时刻:%@",theTime);
    
    // 在 当前时刻 和 预约时刻 中 获取两者靠 后 的时刻
    NSDate *date = [thePresentMoment laterDate:theAppointmentTime];
    NSString *later = [dateFormatter stringFromDate:date];
    // 如果两者靠后的时刻和现在时刻相等 则 预约时刻 在 当前时刻 之前
    if ([later isEqualToString:now]) {
        return NO;
    }else{
        return YES;
    }
//    // 如果当前时刻 + 一个月 < 预约时间 则 超出预约最大时间
//    NSCalendar *gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
//    NSDateComponents* dateComponents = [[NSDateComponents alloc] init];
//    // 设置预约最大时间期限 1 个月
//    [dateComponents setMonth:1];
//    // 可接受的最晚预约时刻
//    NSDate *maxAppointmentTime = [gregorian dateByAddingComponents:dateComponents toDate:thePresentMoment options:0];
//    NSString *maxAppTime = [dateFormatter stringFromDate:maxAppointmentTime];
//    NSLog(@"最晚时刻:%@",maxAppTime);
//    // 在 预约时刻 和 最晚时刻 中 获取两者靠 前 的时刻
//    NSDate *earlierDate = [maxAppointmentTime earlierDate:theAppointmentTime];
//    NSString *earlierTime = [dateFormatter stringFromDate:earlierDate];
    

}
#pragma mark
#pragma mark -读document文件
+(NSArray*)readOperate:(NSString *)afilename//侯尚勇
{
    NSArray *paths=NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask,YES);
    NSString *path=[paths    objectAtIndex:0];
    NSString *filename=[path stringByAppendingPathComponent:afilename];
    
    NSMutableArray *tmparray=[[NSMutableArray alloc] initWithContentsOfFile:filename];
    return tmparray;
}
#pragma mark
#pragma mark -写document文件
+(void)writeOperate:(NSMutableArray *)array filename:(NSString *)afilename//侯尚勇
{
    NSMutableArray *tmparray=[[NSMutableArray alloc]initWithArray:array];
    NSArray *paths=NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask,YES);
    NSString *path=[paths objectAtIndex:0];
    NSString *filename=[path stringByAppendingPathComponent:afilename];
    [tmparray writeToFile:filename  atomically:YES];
}
#pragma mark
#pragma mark -读取resource文件
+(NSString *)readResources:(NSString *)resourcename//侯尚勇
{
    NSBundle *bundel=[NSBundle mainBundle];
    NSString *filePath=[bundel pathForResource:resourcename ofType:nil];
    NSString *fileContent=[NSString stringWithContentsOfFile:filePath encoding:NSUTF8StringEncoding error:nil];
    return fileContent;
}
#pragma mark
#pragma mark -显示TabBar通用方法
+ (void)showTabBarWithAnimationDuration:(CGFloat)durationTime tabBar:(UITabBar *)tabbar
{
    UITabBar *tabBar = tabbar;
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

#pragma mark
#pragma mark -隐藏TabBar通用方法
+ (void)hideTabBarWithAnimationDuration:(CGFloat)durationTime tabBar:(UITabBar *)tabbar
{
    UITabBar *tabBar = tabbar;
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
#pragma mark
#pragma mark -截屏
+ (UIImage *) scaleFromtoSize: (CGSize) size fromView:(UIViewController*)senderViewController;
{
    UIGraphicsBeginImageContext(size);     //currentView 当前的view  创建一个基于位图的图形上下文并指定大小为
    [senderViewController.view.layer renderInContext:UIGraphicsGetCurrentContext()];//renderInContext呈现接受者及其子范围到指定的上下文
    UIImage *viewImage = UIGraphicsGetImageFromCurrentImageContext();//返回一个image
    return viewImage;
}
#pragma mark
#pragma mark -手机号中间加*
+ (NSString *)stringWithPhoneString:(NSString *)phone;
{
    NSMutableString *String1 = [[NSMutableString alloc] initWithString:phone];
    [String1 replaceCharactersInRange:NSMakeRange(3, 4) withString:@"****"];
    return String1;
}
#pragma mark
#pragma mark -获取当前时间yyyy-MM-dd HH:mm:ss
+(NSString *)getCurrentDate:(NSString *)formatString;
{
    NSDateFormatter *dateFormatter=[[[NSDateFormatter alloc] init] autorelease];
    [dateFormatter setDateFormat:formatString];
    return [dateFormatter stringFromDate:[NSDate date]];
}
#pragma mark
#pragma mark - 加密方法

#define gkey            @"jujiaruanjianshunlu666123456"
#define gIv             @"01234567"

+ (NSString*)encrypt:(NSString*)encryptText
 {
    NSData* data = [encryptText dataUsingEncoding:NSUTF8StringEncoding];
    size_t plainTextBufferSize = [data length];
    const void *vplainText = (const void *)[data bytes];
    
    CCCryptorStatus ccStatus;
    uint8_t *bufferPtr = NULL;
    size_t bufferPtrSize = 0;
    size_t movedBytes = 0;
    
    bufferPtrSize = (plainTextBufferSize + kCCBlockSize3DES) & ~(kCCBlockSize3DES - 1);
    bufferPtr = malloc( bufferPtrSize * sizeof(uint8_t));
    memset((void *)bufferPtr, 0x0, bufferPtrSize);
    
    const void *vkey = (const void *) [gkey UTF8String];
    const void *vinitVec = (const void *) [gIv UTF8String];
    
    ccStatus = CCCrypt(kCCEncrypt,
                       kCCAlgorithm3DES,
                       kCCOptionPKCS7Padding,
                       vkey,
                       kCCKeySize3DES,
                       vinitVec,
                       vplainText,
                       plainTextBufferSize,
                       (void *)bufferPtr,
                       bufferPtrSize,
                       &movedBytes);
    
    NSData *myData = [NSData dataWithBytes:(const void *)bufferPtr length:(NSUInteger)movedBytes];
    NSString *result = [GTMBase64 stringByEncodingData:myData];
    return result;
}

#pragma mark
#pragma mark -  解密方法
+ (NSString*)decrypt:(NSString*)decryptText
 {
    NSData *encryptData = [GTMBase64 decodeData:[decryptText dataUsingEncoding:NSUTF8StringEncoding]];
    size_t plainTextBufferSize = [encryptData length];
    const void *vplainText = [encryptData bytes];
    
    CCCryptorStatus ccStatus;
    uint8_t *bufferPtr = NULL;
    size_t bufferPtrSize = 0;
    size_t movedBytes = 0;
    
    bufferPtrSize = (plainTextBufferSize + kCCBlockSize3DES) & ~(kCCBlockSize3DES - 1);
    bufferPtr = malloc( bufferPtrSize * sizeof(uint8_t));
    memset((void *)bufferPtr, 0x0, bufferPtrSize);
    
    const void *vkey = (const void *) [gkey UTF8String];
    const void *vinitVec = (const void *) [gIv UTF8String];
    
    ccStatus = CCCrypt(kCCDecrypt,
                       kCCAlgorithm3DES,
                       kCCOptionPKCS7Padding,
                       vkey,
                       kCCKeySize3DES,
                       vinitVec,
                       vplainText,
                       plainTextBufferSize,
                       (void *)bufferPtr,
                       bufferPtrSize,
                       &movedBytes);
    
    NSString *result = [[[NSString alloc] initWithData:[NSData dataWithBytes:(const void *)bufferPtr
                                                                      length:(NSUInteger)movedBytes] encoding:NSUTF8StringEncoding] autorelease];
    return result;
     
}
+(UIView *)createControl{
    NSString *str = @"abcdefghijklmnopqrstuvwxyz";
    NSInteger r = 1 + random()%15;
    NSString *title = [str substringToIndex:r];
    
    return [Unite createControl:title];
}

+(UIView *)createControl:(NSString *)title{
    //    UILabel *label = [[UILabel alloc] init];
    UIButton *label = [UIButton buttonWithType:UIButtonTypeCustom];
    //    label.text=title;
    //    label.textAlignment = UITextAlignmentCenter;
    
    [label setTitle:title forState:UIControlStateNormal];
    label.backgroundColor = [Unite randomLightingColor];
    label.layer.cornerRadius = 5;
    
    return label;
}

+(UIColor *)randomLightingColor{
    int numberArray[3];
    numberArray[0] = random()%255;
    numberArray[1] = random()%255;
    numberArray[2] = random()%255;
    
    //
    if(numberArray[0] + numberArray[1] < 40){
        numberArray[2] = 125 + random()%125;
    }
    if(numberArray[0] + numberArray[1] + numberArray[2] > 235*3){
        numberArray[2] = random()%125;
    }
    
    
    int i = random()%3;
    int t = numberArray[i];
    numberArray[i] = numberArray[2 - i];
    numberArray[2 - i] = t;
    
    CGFloat r = numberArray[0]/255.0f;
    CGFloat g = numberArray[1]/255.0f;
    CGFloat b = numberArray[2]/255.0f;
    return [UIColor colorWithRed:r green:g blue:b alpha:1];
}
+( void)layerView:(UITextField *) text
{
CAKeyframeAnimation *animation = [CAKeyframeAnimation animation];
animation.keyPath = @"position.x";
animation.values = @[ @0, @10, @-10, @10, @0 ];
animation.keyTimes = @[ @0, @(1 / 6.0), @(3 / 6.0), @(5 / 6.0), @1 ];
animation.duration = 0.4;

animation.additive = YES;

[text.layer addAnimation:animation forKey:@"shake"];
 /**   //圆周运动
    CGRect boundingRect = CGRectMake(-150, -150, 300, 300);
    CAKeyframeAnimation *orbit = [CAKeyframeAnimation animation];
    orbit.keyPath = @"position";
    orbit.path = CFAutorelease(CGPathCreateWithEllipseInRect(boundingRect, NULL));
    orbit.duration = 4;
    orbit.additive = YES;
    orbit.repeatCount = HUGE_VALF;
    orbit.calculationMode = kCAAnimationPaced;
    orbit.rotationMode = kCAAnimationRotateAuto;
    [satellite.layer addAnimation:orbit forKey:@"orbit"];
  */
    /**
    CABasicAnimation *animation = [CABasicAnimation animation];
    animation.keyPath = @"position.x";
    animation.fromValue = @50;
    animation.toValue = @150;
    animation.duration = 1;
    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    [rectangle.layer addAnimation:animation forKey:@"basic"];
    rectangle.layer.position = CGPointMake(150, 0);
     */
    /**
     //向下不弹起
     RBBTweenAnimation *animation = [RBBTweenAnimation animation];
     animation.keyPath = @"position.x";
     animation.fromValue = @50;
     animation.toValue = @150;
     animation.duration = 1;
    animation.easing = RBBCubicBezier(0.68, -0.55, 0.735, 1.55);
     //向下弹起
     RBBTweenAnimation *animation = [RBBTweenAnimation animation];
     animation.keyPath = @"position.x";
     animation.fromValue = @50;
     animation.toValue = @150;
     animation.duration = 1;
     animation.easing = RBBEasingFunctionEaseOutBounce;
     */

}
#pragma mark
#pragma mark -  走马灯动画
+ (void)stringWithLabel:(UILabel *)label title:(NSString *)title state:(HSYTextScrollingState)state ;
{
    if ([title length]> [label.text length]) {
        switch (state) {
            case HSYTextScrollingStateLeft:
            {
                CGRect frame = label.frame;
                frame.origin.x = 0;
                label.frame = frame;
                
                [UIView beginAnimations:@"LabelScrollingAnimation" context:NULL];
                [UIView setAnimationDuration:8.8f];
                [UIView setAnimationCurve:UIViewAnimationCurveLinear];
                [UIView setAnimationDelegate:self];
                [UIView setAnimationRepeatAutoreverses:NO];
                [UIView setAnimationRepeatCount:999999];
                frame = label.frame;
                frame.origin.x = 320;
                label.frame = frame;
                [UIView commitAnimations];
            }
                break;
            case HSYTextScrollingStateRight:
            {
                CGRect frame = label.frame;
                frame.origin.x = 320;
                label.frame = frame;
                [UIView beginAnimations:@"LabelScrollingAnimation" context:NULL];
                [UIView setAnimationDuration:8.8f];
                [UIView setAnimationCurve:UIViewAnimationCurveLinear];
                [UIView setAnimationDelegate:self];
                [UIView setAnimationRepeatAutoreverses:NO];
                [UIView setAnimationRepeatCount:999999];
                frame = label.frame;
                frame.origin.x = -180;
                label.frame = frame;
                [UIView commitAnimations];
            }
                break;
                
            default:
                break;
        }
        
        
    }
    else{
        
    }
}
/**
 *  通过目标的参数，获取一个grid布局
 *
 *  @param perRowItemCount   每行有多少列
 *  @param perColumItemCount 每列有多少行
 *  @param itemWidth         gridItem的宽度
 *  @param itemHeight        gridItem的高度
 *  @param paddingX          gridItem之间的X轴间隔
 *  @param paddingY          gridItem之间的Y轴间隔
 *  @param index             某个gridItem所在的index序号
 *  @param page              某个gridItem所在的页码
 *
 *  @return 返回一个已经处理好的gridItem frame
 */
- (CGRect)getFrameWithPerRowItemCount:(NSInteger)perRowItemCount
                    perColumItemCount:(NSInteger)perColumItemCount
                            itemWidth:(CGFloat)itemWidth
                           itemHeight:(NSInteger)itemHeight
                             paddingX:(CGFloat)paddingX
                             paddingY:(CGFloat)paddingY
                              atIndex:(NSInteger)index
                               onPage:(NSInteger)page
                             fromView:(UIView *)view
{
    CGRect itemFrame = CGRectMake((index % perRowItemCount) * (itemWidth + paddingX) + paddingX + (page * CGRectGetWidth(view.bounds)), ((index / perRowItemCount) - perColumItemCount * page) * (itemHeight + paddingY) + paddingY, itemWidth, itemHeight);
    return itemFrame;
}
#pragma mark
#pragma mark -  发布时间
- (NSString *)newsTime:(NSString *)newsTimes
       knewsTimeFormat:(NSString *)timeFormat
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = timeFormat;
    formatter.locale = [[NSLocale alloc] initWithLocaleIdentifier:kLocaleIdentifier];
    
    NSDate *date = [formatter dateFromString:newsTimes];
    
    NSDate *now = [NSDate date];
    
    // 比较帖子发布时间和当前时间
    NSTimeInterval interval = [now timeIntervalSinceDate:date];
    
    NSString *format;
    if (interval <= 60) {
        format = @"刚刚";
    } else if(interval <= 60*60){
        format = [NSString stringWithFormat:@"发布于前%.f分钟", interval/60];
    } else if(interval <= 60*60*24){
        format = [NSString stringWithFormat:@"发布于前%.f小时", interval/3600];
    } else if (interval <= 60*60*24*7){
        format = [NSString stringWithFormat:@"发布于前%d天", (int)interval/(60*60*24)];
    } else if (interval > 60*60*24*7 & interval <= 60*60*24*30 ){
        format = [NSString stringWithFormat:@"发布于前%d周", (int)interval/(60*60*24*7)];
    }else if(interval > 60*60*24*30 ){
        format = [NSString stringWithFormat:@"发布于前%d月", (int)interval/(60*60*24*30)];
    }
    
    formatter.dateFormat = format;
    return [formatter stringFromDate:date];
}
#pragma mark
#pragma mark -  Image拉伸解决办法
- (UIImage *)imageWithImageName:(NSString *)imageName;
{
UIImage *image = [UIImage imageNamed:imageName];
image = [image stretchableImageWithLeftCapWidth:floorf(image.size.width/2) topCapHeight:floorf(image.size.height/2)];
    return image;
}
- (NSArray *)stringWithTime:(NSString *)time timeFormat:(NSString *)timeFormat
{
NSDateFormatter * dateFormatter = [[NSDateFormatter alloc] init];
[dateFormatter setDateFormat:timeFormat];
NSDate* toDate     = [dateFormatter dateFromString:time];
NSDate*  startDate    = [ [ NSDate alloc] init ];
NSCalendar* chineseClendar = [ [ NSCalendar alloc ] initWithCalendarIdentifier:NSGregorianCalendar ];
NSUInteger unitFlags = NSHourCalendarUnit | NSMinuteCalendarUnit | NSSecondCalendarUnit | NSDayCalendarUnit | NSMonthCalendarUnit | NSYearCalendarUnit;

NSDateComponents *cps = [ chineseClendar components:unitFlags fromDate:startDate  toDate:toDate  options:0];
NSInteger diffYear = [cps year];
NSInteger diffMon = [cps month];
NSInteger diffDay = [cps day];
NSInteger diffHour = [cps hour];
NSInteger diffMin = [cps minute];
NSInteger diffSec = [cps second];
    NSArray *timeArray = [NSMutableArray arrayWithObjects:diffYear,diffMon,diffDay,diffHour,diffMin,diffSec, nil];
    return timeArray;
}
@end
