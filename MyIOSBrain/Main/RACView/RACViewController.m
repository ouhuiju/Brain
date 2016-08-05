//
//  RACViewController.m
//  MyIOSBrain
//
//  Created by OKAR OU on 16/8/5.
//  Copyright © 2016年 OkarOu. All rights reserved.
//

#import "RACViewController.h"
#import "Masonry.h"
#import "ReactiveCocoa.h"

@interface RACViewController()

@property (strong, nonatomic) UITextField *textField;
@property (strong, nonatomic) UILabel *textLabel;

@end

@implementation RACViewController

- (void)viewDidLoad {
    
    self.view.backgroundColor = [UIColor lightGrayColor];
    
    self.textField = [[UITextField alloc] init];
    self.textField.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.textField];
    [self.textField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
        make.centerY.equalTo(self.view);
        make.width.equalTo(@200);
        make.height.equalTo(@40);
    }];
    
    self.textLabel = [UILabel new];
    self.textLabel.backgroundColor = [UIColor whiteColor];
    
    RAC(self.textLabel, text) = self.textField.rac_textSignal;
    
    [self.view addSubview:self.textLabel];
    [self.textLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.textField.mas_top).offset(-200);
        make.centerX.equalTo(self.view);
        make.width.equalTo(@200);
        make.height.equalTo(@40);
    }];
    
    
    [[self.textField rac_signalForControlEvents:UIControlEventEditingChanged] subscribeNext:^(UITextField *textField) {
        NSLog(@"%@", textField.text);
    }];
}

@end
