//
//  EntryDatabase.swift
//  inTune
//
//  Created by Grace Jiang on 9/7/19.
//  Copyright © 2019 Fiona Thendean. All rights reserved.
//

import Foundation

struct EntryDatabase {
    
    static var setUp = false;
    static var entries : [Entry] = []
    
    static func addEntry(e: Entry) {
        entries.append(e)
    }
    
    static func manualSetup() {
        setUp = true
        let entry1 = Entry(name: "Good Things Fall Apart", artist: "Illenium", journalEntry: "missing AC", lyrics: "good tings fall apart", mood: "happy")
        let entry2 = Entry(name: "Senorita", artist: "Shawn Mendes", journalEntry: "academi vibes", lyrics: "lov it when u call me senorita", mood: "sad")
        
        addEntry(e: entry1)
        addEntry(e: entry2)
    }
    
    
}
