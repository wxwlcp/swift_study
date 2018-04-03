//
//  ArtistListViewController.swift
//  Artistry
//
//  Created by 万显武 on 2018/3/21.
//  Copyright © 2018年 众云车服. All rights reserved.
//

import UIKit

class ArtistListViewController: UIViewController {
    
    
    let artlists = Artist.artistsFromBundle()
    

    @IBOutlet weak var ArtistTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        //自动适应高度
        ArtistTableView.rowHeight = UITableViewAutomaticDimension
        ArtistTableView.estimatedRowHeight = 140
        //改变cell.NameLabel.font = UIFont.preferredFont(forTextStyle: UIFontTextStyle.headline) cell.BioLabel.font =  UIFont.preferredFont(forTextStyle: .body)
        
        NotificationCenter.default.addObserver(forName: NSNotification.Name.UIContentSizeCategoryDidChange, object: .none, queue: OperationQueue.main) { [weak self] _ in
            self?.ArtistTableView.reloadData()
        }
    }
    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if let destination = segue.destination as? ArtistDetailViewController,
            let indexPath = ArtistTableView.indexPathForSelectedRow{
            destination.selectedArtist = artlists[indexPath.row]
        }
    }
 

}

extension ArtistListViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("count\(artlists.count)")
        return artlists.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! ArtistTableViewCell
        
        let artist = artlists[indexPath.row]
        
        cell.BioLabel.text = artist.bio
        cell.BioLabel.textColor = UIColor.black
        
        cell.ArtistImageView.image = artist.image
        cell.NameLabel.text = artist.name
        
        cell.NameLabel.backgroundColor = UIColor.init(red: 1, green: 152/255, blue: 0, alpha: 1)
        cell.NameLabel.textColor = UIColor.white
        cell.NameLabel.textAlignment = .center
        cell.selectionStyle = .none
        
        cell.NameLabel.font = UIFont.preferredFont(forTextStyle: UIFontTextStyle.headline)
        cell.BioLabel.font =  UIFont.preferredFont(forTextStyle: .body)
        
        return cell
    }
}
