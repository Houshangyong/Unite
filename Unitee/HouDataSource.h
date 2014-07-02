//
//  HouDataSource.h
//  HSYDataSource
//
//  Created by 123 on 14-6-25.
//  Copyright (c) 2014年 侯尚勇. All rights reserved.
//

#import <Foundation/Foundation.h>
/**
 *
 *配置tableviewDataSource 这个代理
 *
 */

/**
 *     函数名: HSYCellConfigureBlock
 *函数功能概述: 用来配置tableViewcell
 *     传参数: (id cell 一个cell对象, id item 一个数据源对象)
 *     返回值: void
 */
typedef void (^HSYCellConfigureBlock)(id cell, id item);

@interface HouDataSource : NSObject<UITableViewDataSource>
/**
 *     函数名: initWithItems:cellIdentifier:configureCellBlock:
 *函数功能概述: 用来初始化数据 重用单元格常量以及配置Cell block
 *     传参数: (NSArray *)anItems 数据数组 (NSString *)aCellIdentifier)重用单元格常量 (HSYCellConfigureBlock)aConfigureCellBlock  Cell block
 *     返回值: id
 */
- (id)initWithItems:(NSArray *)anItems
     cellIdentifier:(NSString *)aCellIdentifier
 configureCellBlock:(HSYCellConfigureBlock)aConfigureCellBlock;
/**
 *     函数名: itemAtIndexPath:
 *函数功能概述: 用来获取数组里面对象
 *     传参数: (NSIndexPath *)indexPath 数组对象数据indexPath
 *     返回值: id
 */
- (id)itemAtIndexPath:(NSIndexPath *)indexPath;
/**
 - (void)setupTableView
 {
 TableViewCellConfigureBlock configureCell = ^(PhotoCell *cell, Photo *photo) {
 [cell configureForPhoto:photo];
 };
 NSArray *photos = [AppDelegate sharedDelegate].store.sortedPhotos;
 self.photosArrayDataSource = [[ArrayDataSource alloc] initWithItems:photos
 cellIdentifier:PhotoCellIdentifier
 configureCellBlock:configureCell];
 self.tableView.dataSource = self.photosArrayDataSource;
 [self.tableView registerNib:[PhotoCell nib] forCellReuseIdentifier:PhotoCellIdentifier];
 }

 */
@end
