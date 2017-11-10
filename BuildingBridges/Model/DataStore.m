//
//  DataStore.m
//  BuildingBridges
//
//  Created by Tim Ekl on 11/7/17.
//  Copyright © 2017 Tim Ekl. All rights reserved.
//

#import "DataStore.h"
#import "AnimojiKaraoke.h"

@interface DataStore ()
@property (nonatomic, strong) NSMutableSet *songs;
@end

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

+ (NSSet *)defaultSongs;
{
    NSMutableSet *songs = [NSMutableSet set];
    
    AnimojiKaraoke *bohemianRhapsody = [[AnimojiKaraoke alloc] init];
    bohemianRhapsody.songTitle = @"Bohemian Rhapsody";
    bohemianRhapsody.originalArtist = @"Queen";
    bohemianRhapsody.animatorName = @"Mia Harrison";
    bohemianRhapsody.genre = GenreRock;
    bohemianRhapsody.url = [NSURL URLWithString:@"https://twitter.com/ManxomeMia/status/926660732162154496"];
    [songs addObject:bohemianRhapsody];
    
    AnimojiKaraoke *starWarsTheme = [[AnimojiKaraoke alloc] init];
    starWarsTheme.songTitle = @"Star Wars Theme";
    starWarsTheme.originalArtist = @"John Williams";
    starWarsTheme.animatorName = @"Derek Duncan";
    starWarsTheme.genre = GenreClassical;
    starWarsTheme.url = [NSURL URLWithString:@"https://twitter.com/derekduncan/status/927359099079098369"];
    [songs addObject:starWarsTheme];
    
    AnimojiKaraoke *numb = [[AnimojiKaraoke alloc] init];
    numb.songTitle = @"Numb";
    numb.originalArtist = @"Linkin Park";
    numb.animatorName = @"@drbrydges";
    numb.genre = GenreRock;
    numb.url = [NSURL URLWithString:@"https://twitter.com/drbrydges/status/926611859280711680"];
    [songs addObject:numb];
    
    AnimojiKaraoke *always = [[AnimojiKaraoke alloc] init];
    always.songTitle = @"Always";
    always.originalArtist = @"Erasure";
    always.animatorName = @"Popadom Priest";
    always.genre = GenrePop;
    always.url = [NSURL URLWithString:@"https://twitter.com/GeriatricGamer/status/926493361434976256"];
    [songs addObject:always];
    
    return songs;
}

- (id)init;
{
    if (!(self = [super init])) {
        return nil;
    }
    
    _songs = [[[self class] defaultSongs] mutableCopy];
    
    return self;
}

- (NSArray *)songsMatchingPredicate:(NSPredicate *)predicate sortedByDescriptors:(NSArray *)sortDescriptors error:(NSError **)error;
{
    return [[self.songs filteredSetUsingPredicate:predicate] sortedArrayUsingDescriptors:sortDescriptors];
}

- (void)enumerateSongsByGenreWithOptions:(EnumerationOptions)options block:(void (^)(Genre, NSArray *))handler;
{
    NSMutableDictionary *groups = [NSMutableDictionary dictionary];
    for (AnimojiKaraoke *song in self.songs) {
        NSNumber *key = @(song.genre);
        if (groups[key] == nil) {
            groups[key] = [NSMutableArray array];
        }
        [groups[key] addObject:song];
    }
    
    NSArray *keys;
    if ((options & EnumerationOptionListEveryGenre) == EnumerationOptionListEveryGenre) {
        NSMutableArray *genres = [NSMutableArray array];
        for (Genre genre = 0; genre < GenreCount; genre++) {
            [genres addObject:@(genre)];
        }
        keys = [genres copy];
    } else {
        keys = [[groups allKeys] sortedArrayUsingSelector:@selector(compare:)];
    }
    
    NSEnumerationOptions underlyingOptions = 0;
    if ((options & EnumerationOptionReverse) == EnumerationOptionReverse) {
        underlyingOptions |= NSEnumerationReverse;
    }
    
    [keys enumerateObjectsWithOptions:underlyingOptions usingBlock:^(NSNumber *key, NSUInteger idx, BOOL * _Nonnull stop) {
        Genre genre = [key intValue];
        handler(genre, groups[key] ?: @[]);
    }];
}

@end
