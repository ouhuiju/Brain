//
//  MyAspectsIntercepter.m
//  MyIOSBrain
//
//  Created by OKAR OU on 16/7/28.
//  Copyright © 2016年 OkarOu. All rights reserved.
//

#import "MyAspectsIntercepter.h"
#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <Aspects/Aspects.h>
#import "ViewController.h"

@implementation MyAspectsIntercepter

+ (instancetype)sharedInstance {
    static dispatch_once_t onceToken;
    static MyAspectsIntercepter *sharedInstance;
    dispatch_once(&onceToken, ^{
        sharedInstance = [MyAspectsIntercepter new];
    });
    return sharedInstance;
}

+ (void)load {
    [super load];
    /* + (void)load 会在应用启动的时候自动被runtime调用，通过重载这个方法来实现最小的对业务方的“代码入侵” */
    [MyAspectsIntercepter sharedInstance];
}

- (instancetype)init {
    NSError *error = nil;
    self = [super init];
    if (self) {
        [UIViewController aspect_hookSelector:@selector(loadView) withOptions:AspectPositionAfter usingBlock:^(id<AspectInfo>aspectInfo) {
            [self loadView:[aspectInfo instance]];
        } error:&error];
        
        [UIViewController aspect_hookSelector:@selector(viewWillAppear:) withOptions:AspectPositionAfter usingBlock:^(id<AspectInfo> aspectInfo, BOOL animated){
            [self viewWillAppear:animated viewController:[aspectInfo instance]];
        } error:NULL];
        
        
    }
    return self;
}

- (void)hookEvent {
    [ViewController aspect_hookSelector:@selector(aspectListener) withOptions:AspectPositionAfter usingBlock:^(id<AspectInfo> aspectInfo){
        [self aspectListener:[aspectInfo instance]];
    } error:NULL];
}

#pragma mark - fake methods
- (void)loadView:(UIViewController *)viewController
{
    NSLog(@"[%@ loadView]", [viewController class]);
}

- (void)viewWillAppear:(BOOL)animated viewController:(UIViewController *)viewController
{
    NSLog(@"[%@ viewWillAppear:%@]", [viewController class], animated ? @"YES" : @"NO");
}

- (void)aspectListener:(ViewController *)viewController {
    NSLog(@"aspectListener in MyAspectsIntercepter");
    NSLog(@"[%@ aspectListener]", [viewController class]);
}

@end
