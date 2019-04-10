//
//  MWTableView.m
//  MWTemplateTableView
//
//  Created by 石茗伟 on 2019/4/10.
//  Copyright © 2019 聽風入髓. All rights reserved.
//

#import "MWTableView.h"
#import "MWTableDataSource.h"
#import "MWSectionControllerProtocol.h"

@interface MWTableView () <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) NSArray<id<MWSectionControllerProtocol>> *sectionControllers;

@end

@implementation MWTableView

#pragma mark -
#pragma mark Init
- (instancetype)init {
    self = [super init];
    if (self) {
        [self setup];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setup];
    }
    return self;
}

-(instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style {
    self = [super initWithFrame:frame style:style];
    if (self) {
        [self setup];
    }
    return self;
}

- (void)setup {
    self.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.delegate = self;
    self.dataSource = self;
    self.sectionControllers = [self.mwDataSource sectionControllersForIdentifier:self.identifier];
    [self _updateBackgroundViewShouldHide:[self.mwDataSource sectionControllersForIdentifier:self.identifier].count > 0];
}

#pragma mark -
#pragma mark Override
- (void)reloadData {
    self.sectionControllers = [self.mwDataSource sectionControllersForIdentifier:self.identifier];
    [super reloadData];
    [self _updateBackgroundViewShouldHide:[self.mwDataSource sectionControllersForIdentifier:self.identifier].count > 0];
}

#pragma mark -
#pragma mark Private
- (void)_updateBackgroundViewShouldHide:(BOOL)shouldHide {
    UIView *backgroundView = [self.mwDataSource emptyViewForIdentifier:self.identifier];
    if (backgroundView != self.backgroundView) {
        [self.backgroundView removeFromSuperview];
        self.backgroundView = backgroundView;
    }
    self.backgroundView.hidden = shouldHide;
}

#pragma mark -
#pragma mark UITableViewDataSource
// number
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.sectionControllers.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    id<MWSectionControllerProtocol> sectionController = (id<MWSectionControllerProtocol>)self.sectionControllers[section];
    return [sectionController numberOfItems];
}

// height
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    id<MWSectionControllerProtocol> sectionController = (id<MWSectionControllerProtocol>)self.sectionControllers[section];
    return sectionController.headerHeight;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    id<MWSectionControllerProtocol> sectionController = (id<MWSectionControllerProtocol>)self.sectionControllers[indexPath.section];
    return [sectionController heightForIndex:indexPath.row];
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    id<MWSectionControllerProtocol> sectionController = (id<MWSectionControllerProtocol>)self.sectionControllers[section];
    return sectionController.footerHeight;
}

// view
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    id<MWSectionControllerProtocol> sectionController = (id<MWSectionControllerProtocol>)self.sectionControllers[section];
    return sectionController.headerView;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    id<MWSectionControllerProtocol> sectionController = (id<MWSectionControllerProtocol>)self.sectionControllers[indexPath.section];
    return [sectionController tableView:tableView cellForItemAtIndex:indexPath.row];
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    id<MWSectionControllerProtocol> sectionController = (id<MWSectionControllerProtocol>)self.sectionControllers[section];
    return sectionController.footerView;
}

#pragma mark -
#pragma mark UITableViewDelegate
// will display
- (void)tableView:(UITableView *)tableView willDisplayHeaderView:(UIView *)view forSection:(NSInteger)section {
    
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    
}

- (void)tableView:(UITableView *)tableView willDisplayFooterView:(UIView *)view forSection:(NSInteger)section {
    
}

// end display
- (void)tableView:(UITableView *)tableView didEndDisplayingHeaderView:(UIView *)view forSection:(NSInteger)section {
    
}

- (void)tableView:(UITableView *)tableView didEndDisplayingCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    
}

- (void)tableView:(UITableView *)tableView didEndDisplayingFooterView:(UIView *)view forSection:(NSInteger)section {
    
}

// did select
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    id<MWSectionControllerProtocol> sectionController = (id<MWSectionControllerProtocol>)self.sectionControllers[indexPath.section];
    [sectionController didSelectForIndex:indexPath.row];
}

@end
