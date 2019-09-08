//
//  HomeVC.swift
//  inTune
//
//  Created by Christina Lu on 9/7/19.
//  Copyright © 2019 Fiona Thendean. All rights reserved.
//

import UIKit

class HomeVC: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    

    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBAction func journalButton(_ sender: Any) {
        performSegue(withIdentifier: "AddSegue", sender: self)
    }
    @IBAction func addButton(_ sender: Any) {
        performSegue(withIdentifier: "JournalSegue", sender: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        self.collectionView.reloadData()
        
        let dataService = DataService()
        print(dataService.getLyrics(track: "baby", artist: "justin bieber"))
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if (!EntryDatabase.setUp) {
            EntryDatabase.manualSetup()
        }
        super.viewWillAppear(animated)
        
        self.collectionView.dataSource = self
        self.collectionView.reloadData()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return EntryDatabase.entries.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        // update 0 later to entryManager
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "entryCell", for: IndexPath.init()) as? EntryCell
        let c = EntryDatabase.entries[indexPath.row]
        cell!.updateCell(e: c)
        return cell!
    }
    


}
