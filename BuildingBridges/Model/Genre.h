//
//  Genre.h
//  BuildingBridges
//
//  Created by Tim Ekl on 11/7/17.
//  Copyright © 2017 Tim Ekl. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum {
    GenreBlues,
    GenreCountry,
    GenreFolk,
    GenreHipHop,
    GenreJazz,
    GenrePop,
    GenreRB,
    GenreRock,
} Genre;

extern const NSUInteger GenreCount;
extern const Genre GenreUnknown;

extern NSString *GenreLocalizedName(Genre genre);
