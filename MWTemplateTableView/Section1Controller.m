//
//  Section1Controller.m
//  MWTemplateTableView
//
//  Created by 石茗伟 on 2019/4/10.
//  Copyright © 2019 聽風入髓. All rights reserved.
//

#import "Section1Controller.h"

@implementation Section1Controller

- (UITableViewCell *)tableView:(UITableView *)tableView cellForItemAtIndex:(NSInteger)index {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    cell.textLabel.text = @"section1";
    return cell;
}

- (CGFloat)footerHeight {
    return 0;
}

- (UIView *)footerView {
    return nil;
}

- (CGFloat)headerHeight {
    return 0;
}

- (UIView *)headerView {
    return nil;
}

- (CGFloat)heightForIndex:(NSInteger)index {
    return 44.f;
}

- (NSInteger)numberOfItems {
    return 2;
}

- (void)didSelectForIndex:(NSInteger)index {
    NSLog(@"%@", @(index));
}

@end
