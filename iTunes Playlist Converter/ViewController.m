//
//  ViewController.m
//  iTunes Playlist Converter
//
//  Created by Hugo Gonzalez on 7/1/15.
//  Copyright (c) 2015 HG3. All rights reserved.
//

#import "ViewController.h"
#import "iTunes.h"

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    iTunesApplication *iTunes = [SBApplication applicationWithBundleIdentifier:@"com.apple.iTunes"];
    if ([iTunes isRunning]) {
        NSArray *sources = [[iTunes sources] get];
        NSArray *libs = [sources filteredArrayUsingPredicate:[NSPredicate predicateWithFormat:@"kind == %i", iTunesESrcLibrary]];
        if ([libs count]) {
            iTunesSource *src = [libs objectAtIndex:0];
            NSArray *libraryLists = [[src libraryPlaylists] get];
            for (iTunesLibraryPlaylist *list in libraryLists) {
                NSArray *listTracks = [[list fileTracks] get];
                for (iTunesTrack *listTrack in listTracks) {
                    NSLog(@"%@", listTrack.name);
                }
            }
        }
    }
}

- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];

    // Update the view, if already loaded.
}

@end
