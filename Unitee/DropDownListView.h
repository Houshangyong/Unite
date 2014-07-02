//
//  DropDownListView.h
//  HSYApplicationFramework
//
//  Created by 123 on 14-7-2.
//  Copyright (c) 2014年 侯尚勇. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DropDownChooseProtocol.h"

#define SECTION_BTN_TAG_BEGIN   1000
#define SECTION_IV_TAG_BEGIN    3000
@interface DropDownListView : UIView<UITableViewDelegate,UITableViewDataSource>
{
     NSInteger currentExtendSection;     //当前展开的section ，默认－1时，表示都没有展开

}
@property (nonatomic, assign) id<DropDownChooseDelegate> dropDownDelegate;
@property (nonatomic, assign) id<DropDownChooseDataSource> dropDownDataSource;

@property (nonatomic, strong) UIView *mSuperView;
@property (nonatomic, strong) UIView *mTableBaseView;
@property (nonatomic, strong) UITableView *mTableView;

/**
 *
 *   初始化downListView
 *   @pragma  (CGRect)frame                      downListView的范围
 *   @pragma  dataSource:(id)datasource          downListView DataSource
 *   @pragma  delegate:(id) delegate             downListView delegate
 *
 *   @Return  UIView 对象
 *
 */

- (id)initWithFrame:(CGRect)frame
         dataSource:(id)datasource
           delegate:(id) delegate;
/**
 *
 *   根据下标设置downListView分区标题
 *   @pragma  (NSString *)title                  downListView 分区标题
 *   @pragma  (NSInteger) section                downListView 分区下标
 *
 *   @Return  void
 *
 */
- (void)setTitle:(NSString *)title
       inSection:(NSInteger) section;
/**
 *
 *   判断section是否展开 默认－1时，表示都没有展开
 *
 *   @Return  BOOL NO代表-1
 *
 */
- (BOOL)isShow;
/**
 *
 *   隐藏选择的View
 *
 *   @Return void
 *
 */
- (void)hideExtendedChooseView;

@end
