//
//  Entry.swift
//  inTune
//
//  Created by Grace Jiang on 9/7/19.
//  Copyright © 2019 Fiona Thendean. All rights reserved.
//

import Foundation
import UIKit

struct Entry {
    
    var name : String = ""
    var artist : String = ""
    var imgUrl : String = ""
    var date : Date
    //var img : UIImageView
    var lyrics : String = ""
    var journalEntry : String = ""
    var mood : String = ""
    
    init(name : String, artist : String, journalEntry : String, lyrics : String, mood: String) {
        self.name = name
        self.date = Date()
        self.lyrics = lyrics
        self.artist = artist
        self.journalEntry = journalEntry
        self.mood = mood
    }
    
    
    
}
