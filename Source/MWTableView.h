//
//  MWTableView.h
//  MWTemplateTableView
//
//  Created by 石茗伟 on 2019/4/10.
//  Copyright © 2019 聽風入髓. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol MWTableDataSource;

NS_ASSUME_NONNULL_BEGIN

@interface MWTableView : UITableView

@property (nonatomic, copy, nullable) NSString *identifier;
@property (nonatomic, weak, nullable) id<MWTableDataSource> mwDataSource;

@end

NS_ASSUME_NONNULL_END
