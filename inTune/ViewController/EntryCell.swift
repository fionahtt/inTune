//
//  EntryCell.swift
//  inTune
//
//  Created by Grace Jiang on 9/7/19.
//  Copyright © 2019 Fiona Thendean. All rights reserved.
//

import UIKit

class EntryCell: UICollectionViewCell {
    

    
    @IBOutlet weak var dayLabel: UILabel!
    
    func updateCell(e: Entry) {
        let dayFormatter = DateFormatter()
        dayFormatter.dateFormat = "MMM dd yyyy"
        
        dayLabel.text = dayFormatter.string(from: e.date)
        
        switch e.mood {
        case "happy":
            backgroundColor = .yellow
            break
        case "sad":
            backgroundColor = .blue
            break
        case "okay":
            backgroundColor = .purple
            break
        default:
            break
        }
    }
    
}
