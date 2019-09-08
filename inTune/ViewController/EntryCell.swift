//
//  EntryCell.swift
//  inTune
//
//  Created by Grace Jiang on 9/7/19.
//  Copyright © 2019 Fiona Thendean. All rights reserved.
//

import UIKit

extension UIColor {
    convenience init(red: Int, green: Int, blue: Int) {
        assert(red >= 0 && red <= 255, "Invalid red component")
        assert(green >= 0 && green <= 255, "Invalid green component")
        assert(blue >= 0 && blue <= 255, "Invalid blue component")
        
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
    }
    
    convenience init(rgb: Int) {
        self.init(
            red: (rgb >> 16) & 0xFF,
            green: (rgb >> 8) & 0xFF,
            blue: rgb & 0xFF
        )
    }
}

class EntryCell: UICollectionViewCell {
    

    
    @IBOutlet weak var dayLabel: UILabel!
    
    func updateCell(e: Entry) {
        let dayFormatter = DateFormatter()
        dayFormatter.dateFormat = "MMM dd yyyy"
        
        dayLabel.text = dayFormatter.string(from: e.date)
        
        switch e.mood {
        case "happy":
            backgroundColor = UIColor(rgb: 0xfdfd96)
            break
        case "sad":
            backgroundColor = UIColor(rgb: 0xaec6cf)
            break
        case "okay":
            backgroundColor = UIColor(rgb: 0xb19cd9)
            break
        default:
            break
        }
    }
    
}
