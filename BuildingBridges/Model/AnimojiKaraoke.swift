//
//  AnimojiKaraoke.swift
//  BuildingBridges
//
//  Created by Tim Ekl on 11/9/17.
//  Copyright © 2017 Tim Ekl. All rights reserved.
//

import Foundation

extension AnimojiKaraoke {
    
    var genre: Genre? {
        if __genre == GenreUnknown { return nil }
        return __genre
    }
    
}
