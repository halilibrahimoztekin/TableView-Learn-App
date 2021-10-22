//
//  imageViewController.swift
//  TableViewLearnApp
//
//  Created by Bukefalos on 22.10.2021.
//

import UIKit

class imageViewController: UIViewController {
    var selectedLandmarkName = ""
    var selectedLandmarkImageName = UIImage()
    @IBOutlet weak var landmarkLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageView.image = selectedLandmarkImageName
        landmarkLabel.text = selectedLandmarkName
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
