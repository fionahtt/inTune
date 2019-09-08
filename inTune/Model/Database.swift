//
//  Database.swift
//  inTune
//
//  Created by Fiona Thendean on 9/7/19.
//  Copyright © 2019 Fiona Thendean. All rights reserved.
//

import Foundation
import UIKit

struct Database {
    var songs = [Song]()
    
    func numSongs() -> Int {
        return songs.count
    }
    
    func getSong(i: Int) -> Song {
        return songs[i]
    }
    
    mutating func addSongs(songsParam: [Song]) {
        songs.removeAll()
        songs.append(contentsOf: songsParam)
    }
    
    
}

