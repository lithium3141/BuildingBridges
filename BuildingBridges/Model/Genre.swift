//
//  Genre.swift
//  BuildingBridges
//
//  Created by Tim Ekl on 11/9/17.
//  Copyright © 2017 Tim Ekl. All rights reserved.
//

import Foundation

extension Genre {
    var localizedName: String {
        return __GenreLocalizedName(self)
    }
}
