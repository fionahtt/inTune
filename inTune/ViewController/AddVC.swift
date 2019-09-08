//
//  AddVC.swift
//  inTune
//
//  Created by Christina Lu on 9/7/19.
//  Copyright © 2019 Fiona Thendean. All rights reserved.
//

import UIKit

class AddVC: UIViewController {

    @IBOutlet weak var journalTextField: UITextField!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var artistTextField: UITextField!
    @IBOutlet weak var lyricsTextField: UITextField!
    @IBOutlet weak var emotionPickerView: UIPickerView!
    
    var moods : [String] = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.emotionPickerView.delegate = self
        self.emotionPickerView.dataSource = self
        
        moods = ["Happy", "Okay", "Sad"]
    }
    
    @IBAction func submitButton(_ sender: Any) {
        var mood = ""
        switch emotionPickerView.selectedRow(inComponent: 0) {
        case 0:
            mood = "happy"
            break
        case 1:
            mood = "okay"
            break
        case 2:
            mood = "sad"
            break
        default:
            break
        }
        let entry = Entry(name: nameTextField.text ?? "", artist: artistTextField.text ?? "", journalEntry: journalTextField.text ?? "", lyrics: lyricsTextField.text ?? "", mood: mood)
        EntryDatabase.addEntry(e: entry)
        performSegue(withIdentifier: "goHome", sender: self)
    
    }

}

extension AddVC: UIPickerViewDelegate, UIPickerViewDataSource {
    public func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    public func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return moods.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return moods[row]
    }
}
