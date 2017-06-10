//
//  ExhibitionsViewController.swift
//  GalleryGuide
//
//  Created by Kirill Kirikov on 6/4/17.
//  Copyright © 2017 Seductive. All rights reserved.
//

import UIKit

class ExhibitionsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ExhibitionsModel.instance.exhibitions.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")!
        let exhibition = ExhibitionsModel.instance.exhibitions[indexPath.row]
        cell.textLabel?.text = exhibition.name
        return cell
    }
    /*
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let exhibition = ExhibitionsModel.instance.exhibitions[(indexPath.row)]
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        let detailsViewController = storyboard.instantiateViewController(withIdentifier: "DetailsViewController") as! DetailsViewController
        detailsViewController.exhibition = exhibition
        navigationController?.pushViewController(detailsViewController, animated: true)
    }
    */
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "showData" {
        let cell = sender as! UITableViewCell
        let indexPath = tableView.indexPath(for: cell)
        let exhibition = ExhibitionsModel.instance.exhibitions[(indexPath?.row)!]
        let destination = segue.destination as! DetailsViewController
            destination.exhibition = exhibition
        }
    }
}
