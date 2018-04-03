//
//  ArtistDetailViewController.swift
//  Artistry
//
//  Created by 万显武 on 2018/3/21.
//  Copyright © 2018年 众云车服. All rights reserved.
//

import UIKit

class ArtistDetailViewController: UIViewController {
  
    
    var selectedArtist:Artist!
    
    let moreInfoText = "Select For More Info >"
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = selectedArtist.name
        // Do any additional setup after loading the view.
        
        
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 300
        
        NotificationCenter.default.addObserver(forName: NSNotification.Name.UIContentSizeCategoryDidChange, object: nil, queue: OperationQueue.main) { [weak self] _ in
            self?.tableView.reloadData()
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
}

extension ArtistDetailViewController:UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("selellele\(selectedArtist.works.count)")
        return selectedArtist.works.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "workCell", for: indexPath) as! WorkTableViewCell
        
        let work = selectedArtist.works[indexPath.row]
        
        cell.workTitleLabel.text = work.title
        cell.workImageView.image = work.image
        
        cell.workTitleLabel.backgroundColor = UIColor(white: 204/255, alpha: 1)
        cell.workTitleLabel.textAlignment = .center
        cell.moreInfoTextView.textColor = UIColor(white: 114 / 255, alpha: 1)
        cell.selectionStyle = .none
        
        cell.moreInfoTextView.text = work.isExpanded ? work.info : moreInfoText
        cell.moreInfoTextView.textAlignment = work.isExpanded ? .left : .center
        
        cell.workTitleLabel.font = UIFont.preferredFont(forTextStyle: UIFontTextStyle.headline)
        cell.moreInfoTextView.font = UIFont.preferredFont(forTextStyle: UIFontTextStyle.footnote)
        
        return cell
        
    }
}

extension ArtistDetailViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let cell = tableView.cellForRow(at: indexPath) as? WorkTableViewCell else {
            return
        }
        
        var work = selectedArtist.works[indexPath.row]
        
        work.isExpanded = !work.isExpanded
        selectedArtist.works[indexPath.row] = work
        print("isExpanded\(work.isExpanded)")
        cell.moreInfoTextView.text = work.isExpanded ? work.info : moreInfoText
        cell.moreInfoTextView.textAlignment = work.isExpanded ? .left : .center
        
        tableView.beginUpdates()
        tableView.endUpdates()
        
        tableView.scrollToRow(at: indexPath, at: .top, animated: true)
    }
}
