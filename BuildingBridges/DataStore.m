//
//  DataStore.m
//  BuildingBridges
//
//  Created by Tim Ekl on 11/7/17.
//  Copyright © 2017 Tim Ekl. All rights reserved.
//

#import "DataStore.h"

@implementation DataStore

+ (DataStore *)sharedInstance;
{
    static DataStore *instance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[DataStore alloc] init];
    });
    return instance;
}

@end
