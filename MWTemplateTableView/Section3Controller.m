//
//  Section3Controller.m
//  MWTemplateTableView
//
//  Created by 石茗伟 on 2019/4/10.
//  Copyright © 2019 聽風入髓. All rights reserved.
//

#import "Section3Controller.h"

@implementation Section3Controller

- (UITableViewCell *)tableView:(UITableView *)tableView cellForItemAtIndex:(NSInteger)index {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    cell.textLabel.text = @"section3";
    return cell;
}

- (CGFloat)footerHeight {
    return 0;
}

- (UIView *)footerView {
    return nil;
}

- (CGFloat)headerHeight {
    return 20;
}

- (UIView *)headerView {
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0.f, 0.f, 100.f, 20.f)];
    label.text = @"section3";
    return label;
}

- (CGFloat)heightForIndex:(NSInteger)index {
    return 44.f;
}

- (NSInteger)numberOfItems {
    return 4;
}

- (void)didSelectForIndex:(NSInteger)index {
    NSLog(@"%@", @(index));
}

@end
