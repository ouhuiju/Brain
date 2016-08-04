//
//  AOPHelper.h
//  MyIOSBrain
//
//  Created by OKAR OU on 16/7/29.
//  Copyright © 2016年 OkarOu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AOPStore : NSObject

+ (instancetype)sharedInstance;
- (void)aspectListener;

@end
