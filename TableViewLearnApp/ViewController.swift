//
//  ViewController.swift
//  TableViewLearnApp
//
//  Created by Bukefalos on 21.10.2021.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate,UITableViewDataSource {
    
    
    var chosenLandmarkNamesImages = UIImage()
    var chosenLandmarkNames = ""
    var landmarkNames = [String]()

    var lanndmarkImages = [UIImage]()
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Ekranın Genişliği ve Yüksekliği
        let widht = view.frame.size.width
        let height = view.frame.size.height
        tableView.delegate = self
        tableView.dataSource = self
        
        
        //  Statik Veri Listeleri //
        landmarkNames.append("Berlin")
        landmarkNames.append("İstanbul")
        landmarkNames.append("Londra")
        landmarkNames.append("Paris")
        
        lanndmarkImages.append(UIImage(named: "berlin")!)
        lanndmarkImages.append(UIImage(named: "istanbul")!)
        lanndmarkImages.append(UIImage(named: "londra")!)
        lanndmarkImages.append(UIImage(named: "paris")!)
        
        // Navigation Toolbar Özellikleri
        navigationItem.title = "Landmark Book"
        navigationItem.backButtonTitle = "Geri"
        
        
        
        
        
    }
    
    
    // Ekrandaki Cell Sayısı
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return landmarkNames.count
    }
    
    // Hücre Silme Fonksiyonu
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if  editingStyle == .delete
        {
            landmarkNames.remove(at: indexPath.count)
            lanndmarkImages.remove(at: indexPath.count)
            tableView.deleteRows(at: [indexPath], with: UITableView.RowAnimation.fade)
        }
    }
    
    // Hücreleri Listeleme İndex Alma Fonksiyonu
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = landmarkNames[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
         chosenLandmarkNames = landmarkNames[indexPath.row]
         chosenLandmarkNamesImages = lanndmarkImages[indexPath.row]
        performSegue(withIdentifier: "toImageViewSegue", sender: nil)
    }
    
    // Diğer Sayfaya Veri Aktarımını Gerçekleştirme
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "toImageViewSegue"{
            
            let destinationVC = segue.destination as! imageViewController
            destinationVC.selectedLandmarkName = chosenLandmarkNames
            destinationVC.selectedLandmarkImageName = chosenLandmarkNamesImages
            
        }
        
        
        }
}

