//
//  DataStore.h
//  BuildingBridges
//
//  Created by Tim Ekl on 11/7/17.
//  Copyright © 2017 Tim Ekl. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Genre.h"

NS_ASSUME_NONNULL_BEGIN

typedef NS_OPTIONS(NSUInteger, EnumerationOptions) {
    EnumerationOptionReverse = 1 << 0,
    EnumerationOptionListEveryGenre = 1 << 1,
};

typedef void (^GenreEnumerationHandler)(Genre, NSArray *);

@interface DataStore : NSObject

@property (nonatomic, readonly, class) DataStore *sharedInstance;

- (nullable NSArray *)songsMatchingPredicate:(NSPredicate *)predicate sortedByDescriptors:(nullable NSArray *)sortDescriptors error:(NSError **)error;

- (void)enumerateSongsByGenreWithOptions:(EnumerationOptions)options block:(nullable GenreEnumerationHandler)handler;

@end

NS_ASSUME_NONNULL_END
