//
//  DataStore.h
//  BuildingBridges
//
//  Created by Tim Ekl on 11/7/17.
//  Copyright © 2017 Tim Ekl. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Genre.h"

typedef enum {
    EnumerationOptionReverse = 1 << 0,
    EnumerationOptionListEveryGenre = 1 << 1,
} EnumerationOptions;

@interface DataStore : NSObject

+ (DataStore *)sharedInstance;

- (NSArray *)songsMatchingPredicate:(NSPredicate *)predicate sortedByDescriptors:(NSArray *)sortDescriptors error:(NSError **)error;

- (void)enumerateSongsByGenreWithOptions:(EnumerationOptions)options block:(void (^)(Genre, NSArray *))handler;

@end
