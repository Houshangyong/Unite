//
//  Unite.h
//  HSYApplicationFramework
//
//  Created by 123 on 14-6-18.
//  Copyright (c) 2014年 侯尚勇. All rights reserved.
//

#import <Foundation/Foundation.h>
/***************************************************************************
 *
 * 工具类
 *
 ***************************************************************************/
/**
//保存图片到相册
 UIImageWriteToSavedPhotosAlbum(self.photoImageView.image,self,@selector(image:didFinishSavingWithError:contextInfo:),nil);
 -(void)image:(UIImage *)image didFinishSavingWithError:(NSError *)error contextInfo:(void *)contextInfo
 {
 if (error != NULL)
 {
 NSLog(@"%@",error);
 }
 else
 {
 NSLog(@"save success!");
 }
 }
 */
typedef enum{
	HSYTextScrollingStateLeft = 0,
    HSYTextScrollingStateRight
} HSYTextScrollingState;
@class AppDelegate;
@interface Unite : NSObject
/**
 AppDelegate
 */
+(AppDelegate *)applicationDelegate;
/**
 isValidateEmail 邮箱
 */
+(BOOL)isValidateEmail:(NSString *)email;
/**
 isValidatePhone 手机号
 */
+ (BOOL)isValidatePhone:(NSString *)phone;
/**
 validateUserPasswd 用户密码
 */
+ (BOOL) validateUserPasswd : (NSString *) UserPasswd;
/**
 validateUserBornDate 生日
 */
+ (BOOL) validateUserBornDate : (NSString *) UserBornDate;
/**
 validateCarNo 车牌号验证
 */
+ (BOOL) validateCarNo:(NSString *)carNo;
/**
 validateIdentityCard 身份证验证
 */
+ (BOOL) validateIdentityCard: (NSString *)identityCard;
/**
 isValidateIdcard 军官证验证
 */
+ (BOOL)isValidateIdcard:(NSString *)idCard ;
/**
 isValidateIdPassPortCard 护照验证
 */
+ (BOOL)isValidateIdPassPortCard:(NSString *)passportCard;
/**
 validateCarType 车型验证
 */
+ (BOOL) validateCarType:(NSString *)CarType;
/**
 validateCarType 用户名验证
 */
+ (BOOL) validateUserName:(NSString *)name;
/**
 appointmentTime 单前时间与一个时间比较 NO:当前时间之前
 */
+(BOOL) appointmentTime:(NSString *)appointmentTime;
/**
 UILable
 */
+ (UILabel *)labelWithWidth:(CGFloat)width
                   withLeft:(CGFloat)leftX
                    withTop:(CGFloat)topy
                  withTitle:(NSString *)title
              titleFontSize:(UIFont *)font
                  textColor:(UIColor *)color
            backgroundColor:(UIColor *)bgColor
                  alignment:(NSTextAlignment)textAlignment ;
/**
 UIImageView
 */
+ (UIImageView *)imageViewWithFrame:(CGRect)frame
                          withImage:(UIImage *)image;
/**
 UIButton
 */
+(UIButton *)createBtnWithType:(UIButtonType)btnType
                         frame:(CGRect)btnFrame
               backgroundColor:(UIColor*)bgColor
                         title:(NSString *)title
                    titleColor:(UIColor*)TCColor
                         Image:(UIImage *)btnImage
               backgroundImage:(UIImage *)bgImage
                         state:(UIControlState)btnState;
/**
 UIAlertView提示框
 */
+(UIAlertView *)alertTitle:(NSString *)title
                   message:(NSString *)msg
                  delegate:(id)aDeleagte
                 cancelBtn:(NSString *)cancelName
              otherBtnName:(NSString *)otherbuttonName;
/**
 *  通过目标的参数，读document文件
 *
 *  @param afilename         要读取的document文件名字
 *
 *  @return
 */
+(NSArray*)readOperate:(NSString *)afilename;
/**
 *  通过目标的参数，写document文件
 *
 *  @param array             写入document数据
 *  @param afilename         写入document文件名字.plist
 *
 *  @return
 */
+(void)writeOperate:(NSMutableArray *)array
           filename:(NSString *)afilename;
/**
 *  通过目标的参数，读Resources文件
 *
 *  @param resourcename        Resources名字
 *
 *  @return NSString
 */
+(NSString *)readResources:(NSString *)resourcename;
/**
 *  通过目标的参数，显示Tabbar
 *
 *  @param durationTime        显示动画时间
 *  @param tabbar              需要显示的tabBar
 *
 *  @return
 */
+ (void)showTabBarWithAnimationDuration:(CGFloat)durationTime
                                 tabBar:(UITabBar *)tabbar;
/**
 *  通过目标的参数，隐藏Tabbar
 *
 *  @param durationTime     隐藏动画时间
 *  @param tabbar           需要隐藏的tabBar
 *
 *  @return
 */
+ (void)hideTabBarWithAnimationDuration:(CGFloat)durationTime
                                 tabBar:(UITabBar *)tabbar;
/**
 *  通过目标的参数，截取屏幕
 *
 *  @param size                    需要截取范围
 *  @param senderViewController    从哪里截取
 *
 *  @return  NSString
 */
+ (UIImage *) scaleFromtoSize: (CGSize) size
                     fromView:(UIViewController*)senderViewController;
/**
 *  通过目标的参数，隐藏手机号四位(手机号中间加****)
 *
 *  @param phone       手机号字符串
 *
 *  @return  NSString
 */
+ (NSString *)stringWithPhoneString:(NSString *)phone;
/**
 *  通过目标的参数，获取当前时间
 *
 *  @param formatString      formatString时间格式example:(yyyy-MM-dd HH:mm:ss)
 *
 *  @return  NSString
 */
+(NSString *)getCurrentDate:(NSString *)formatString;
/**
 *  通过目标的参数，获取BASE64编码加密字符串
 *
 *  @param decryptText      需要加密字符串
 *
 *  @return 返回一个已经解密的 NSString
 */
+ (NSString*)encrypt:(NSString*)encryptText;
/**
 *  通过目标的参数，获取BASE64编码解密字符串
 *
 *  @param decryptText      需要解密字符串
 *
 *  @return 返回一个已经解密的 NSString
 */
+ (NSString*)decrypt:(NSString*)decryptText;
+(UIView *)createControl;
+(UIView *)createControl:(NSString *)title;
+(UIColor *)randomLightingColor;
/**
 *  密码输入错误抖动动画
 *
 *  @param text             密码参数
 *
 *  @return
 */
+( void)layerView:(UITextField *) text;
/**
 *  通过目标的参数，获取简单走马灯滚动动画
 *
 *  @param label            目标控件
 *  @param title            显示文字
 *  @param state            动画状态
 *
 *  @return
 */
+ (void)stringWithLabel:(UILabel *)label
                  title:(NSString *)title
                  state:(HSYTextScrollingState)state ;
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
                             fromView:(UIView *)view;
/** 
 *
 *  Image拉伸解决办法
 *
 *  @param newsTimes   发部时间
 *  @param timeFormat  时间格式
 *
 *  @return NSString
 */
- (NSString *)newsTime:(NSString *)newsTimes
       knewsTimeFormat:(NSString *)timeFormat;
/**
 *
 *  Image拉伸解决办法
 *
 *  @param imageName   图片名字
 *
 *  @return UIImage
 */
- (UIImage *)imageWithImageName:(NSString *)imageName;
/**
 *
 *  判断两个日期之间的间隔 两个时间段，判断之间的相差，做一些时间范围限制使用 选项有，年，月，日，时，分，秒
 *
 *  @param time         需要比较的时间
 *  @param timeFormat   设定时间格式
 *
 *  @return NSArray NSArray按 年，月，日，时，分，秒依次添加
 */
- (NSArray *)stringWithTime:(NSString *)time
                 timeFormat:(NSString *)timeFormat;
@end
