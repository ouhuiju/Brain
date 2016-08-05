//
//  ViewController.m
//  MyIOSBrain
//
//  Created by 区慧驹 on 16/7/26.
//  Copyright © 2016年 OkarOu. All rights reserved.
//

#import "ViewController.h"
#import "MyAspectsIntercepter.h"
#import "AOPStore.h"
#import "ReactiveCocoa.h"
#import "RACViewController.h"

@class RACSignal;

@interface ViewController ()

@property (nonatomic, strong) NSArray *agendaItems;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //    self.title = @"Native";
    _agendaItems = @[@"UI Technology",@"Back-End Technology"];
    [[MyAspectsIntercepter sharedInstance] hookEvent];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)initTableView {
    self.tableView.tableFooterView = [UIView new];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _agendaItems.count;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    if (indexPath.row == 1) {
        [self.navigationController pushViewController:[RACViewController new] animated:YES];
    }
    
    [[AOPStore sharedInstance] aspectListener];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"rootCellIdentifier" forIndexPath:indexPath];
    cell.textLabel.text = _agendaItems[indexPath.row];
    
    return cell;
}

@end
