//
//  FirstViewController.m
//  MWTemplateTableView
//
//  Created by 石茗伟 on 2019/4/10.
//  Copyright © 2019 聽風入髓. All rights reserved.
//

#import "FirstViewController.h"
#import "MWTableView.h"
#import "MWTableDataSource.h"
#import "Section1Controller.h"
#import "Section2Controller.h"
#import "Section3Controller.h"

@interface FirstViewController () <MWTableDataSource>

@property (nonatomic, strong) MWTableView *tableView1;
@property (nonatomic, strong) MWTableView *tableView2;
@property (nonatomic, strong) NSArray *sections1;
@property (nonatomic, strong) NSArray *sections2;
@property (nonatomic, strong) Section1Controller *section1;
@property (nonatomic, strong) Section2Controller *section2;
@property (nonatomic, strong) Section3Controller *section3;

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.tableView1.mwDataSource = self;
    self.tableView1.identifier = @"tableView1";
    self.tableView1.frame = CGRectMake(0, 0, 300, 400);
    [self.view addSubview:self.tableView1];
    
    self.tableView2.mwDataSource = self;
    self.tableView2.identifier = @"tableView2";
    self.tableView2.frame = CGRectMake(0, 430, 300, 400);
    [self.view addSubview:self.tableView2];
    
    self.section1 = [[Section1Controller alloc] init];
    self.section2 = [[Section2Controller alloc] init];
    self.section3 = [[Section3Controller alloc] init];
    
    [self performSelector:@selector(updateTable1) withObject:nil afterDelay:2.f];
    [self performSelector:@selector(updateTable2) withObject:nil afterDelay:3.f];
}

- (void)updateTable1 {
    self.sections1 = @[self.section1, self.section2, self.section3];
    [self.tableView1 reloadData];
}

- (void)updateTable2 {
    self.sections2 = @[self.section1, self.section3];
    [self.tableView2 reloadData];
}

#pragma mark -
#pragma mark MWTableDataSource
- (nullable NSArray<id<MWSectionControllerProtocol>> *)sectionControllersForIdentifier:(nullable NSString *)identifier {
    if ([identifier isEqualToString:@"tableView1"]) {
        return self.sections1;
    } else if ([identifier isEqualToString:@"tableView2"]) {
        return self.sections2;
    }
    return @[];
}

- (nullable UIView *)emptyViewForIdentifier:(NSString *)identifier {
    UILabel *noDataLabel = [[UILabel alloc] init];
    noDataLabel.text = @"没有数据";
    noDataLabel.textAlignment = NSTextAlignmentCenter;
    return noDataLabel;
}

#pragma mark -
#pragma mark LazyLoad
- (MWTableView *)tableView1 {
    if (!_tableView1) {
        self.tableView1 = [[MWTableView alloc] init];
    }
    return _tableView1;
}

- (MWTableView *)tableView2 {
    if (!_tableView2) {
        self.tableView2 = [[MWTableView alloc] init];
    }
    return _tableView2;
}

@end
