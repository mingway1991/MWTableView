//
//  UserModel.h
//  MWTemplateTableView
//
//  Created by 石茗伟 on 2019/4/10.
//  Copyright © 2019 聽風入髓. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface UserModel : NSObject

@property (nonatomic, copy) NSString *nickname;
@property (nonatomic, copy) NSString *city;
@property (nonatomic, copy) NSString *address;
@property (nonatomic, copy) NSString *info1;
@property (nonatomic, copy) NSString *info2;

@end

NS_ASSUME_NONNULL_END
