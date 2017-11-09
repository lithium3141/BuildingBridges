//
//  Genre.m
//  BuildingBridges
//
//  Created by Tim Ekl on 11/7/17.
//  Copyright © 2017 Tim Ekl. All rights reserved.
//

#import "Genre.h"

const NSUInteger GenreCount = GenreRock + 1;
const Genre GenreUnknown = (Genre)NSNotFound;

NSString *GenreLocalizedName(Genre genre) {
    switch (genre) {
        case GenreBlues: return NSLocalizedString(@"Blues", @"blues genre name");
        case GenreCountry: return NSLocalizedString(@"Country", @"country genre name");
        case GenreFolk: return NSLocalizedString(@"Folk", @"folk genre name");
        case GenreHipHop: return NSLocalizedString(@"Hip-Hop", @"hip-hop genre name");
        case GenreJazz: return NSLocalizedString(@"Jazz", @"jazz genre name");
        case GenrePop: return NSLocalizedString(@"Pop", @"pop genre name");
        case GenreRB: return NSLocalizedString(@"Rhythm & Blues", @"R&B genre name");
        case GenreRock: return NSLocalizedString(@"Rock", @"rock genre name");
        default: return NSLocalizedString(@"Unknown", @"unknown genre name");
    }
}
