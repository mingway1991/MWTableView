//
//  MWSectionControllerProtocol.h
//  MWTemplateTableView
//
//  Created by 石茗伟 on 2019/4/10.
//  Copyright © 2019 聽風入髓. All rights reserved.
//

@import UIKit;

NS_ASSUME_NONNULL_BEGIN

@protocol MWSectionControllerProtocol <NSObject>

- (nullable UIView *)headerView;
- (nullable UIView *)footerView;
- (CGFloat)headerHeight;
- (CGFloat)footerHeight;
- (NSInteger)numberOfItems;
- (CGFloat)heightForIndex:(NSInteger)index;
- (UITableViewCell *)tableView:(UITableView *)tableView cellForItemAtIndex:(NSInteger)index;

@optional
- (void)didSelectForIndex:(NSInteger)index;

@end

NS_ASSUME_NONNULL_END
