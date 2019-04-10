//
//  MWTableDataSource.h
//  MWTemplateTableView
//
//  Created by 石茗伟 on 2019/4/10.
//  Copyright © 2019 聽風入髓. All rights reserved.
//

@protocol MWSectionControllerProtocol;

NS_ASSUME_NONNULL_BEGIN

@protocol MWTableDataSource <NSObject>

- (nullable NSArray<id<MWSectionControllerProtocol>> *)sectionControllersForIdentifier:(nullable NSString *)identifier;
- (nullable UIView *)emptyViewForIdentifier:(nullable NSString *)identifier;

@end

NS_ASSUME_NONNULL_END
