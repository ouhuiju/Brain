//
//  AOPHelper.m
//  MyIOSBrain
//
//  Created by OKAR OU on 16/7/29.
//  Copyright © 2016年 OkarOu. All rights reserved.
//

#import "AOPStore.h"

@implementation AOPStore

+ (instancetype)sharedInstance {
    static dispatch_once_t onceToken;
    static AOPStore *sharedInstance;
    dispatch_once(&onceToken, ^{
        sharedInstance = [AOPStore new];
    });
    return sharedInstance;
}

/**
 *  @author OKAR OU (EUCD-EUC-ISD-OOCLL/ZHA), 16-07-28 11:07:11
 *
 *  this function for test AOP.
 */
- (void)aspectListener {
    NSLog(@"aspectListener");
}

@end
