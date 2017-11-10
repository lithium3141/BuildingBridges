//
//  AnimojiKaraoke.h
//  BuildingBridges
//
//  Created by Tim Ekl on 11/7/17.
//  Copyright © 2017 Tim Ekl. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Genre.h"

NS_ASSUME_NONNULL_BEGIN

@interface AnimojiKaraoke : NSObject

@property (nonatomic, copy) NSString *songTitle;
@property (nonatomic, copy) NSString *originalArtist;
@property (nonatomic, copy) NSString *animatorName;

@property (nonatomic, readonly) BOOL hasGenre NS_SWIFT_UNAVAILABLE("AnimojiKaraoke.genre is optional in Swift");
@property (nonatomic, assign) Genre genre NS_REFINED_FOR_SWIFT;

@property (nonatomic, copy) NSURL *url;

@end

NS_ASSUME_NONNULL_END
