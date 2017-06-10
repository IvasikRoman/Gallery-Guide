//
//  DetailsViewController.swift
//  GalleryGuide
//
//  Created by Elena on 07.06.17.
//  Copyright © 2017 Seductive. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var aboutLabel: UILabel!
    
    var exhibition:ExhibitionVO!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameLabel.text = exhibition.name
        aboutLabel.text = exhibition.about
        
        // Do any additional setup after loading the view.
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
