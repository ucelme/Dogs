//
//  ViewController.swift
//  Dogs
//
//  Created by Oleg Starkin on 12/6/20.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Network.fetchDataImage { (dog) in
            let image = Network.fetchImage(url: dog.message)
            DispatchQueue.main.async {
                self.imageView.image = image
            }
        }
    }
    
    
    @IBAction func refresh(_ sender: Any) {
        Network.fetchDataImage { (dog) in
            let image = Network.fetchImage(url: dog.message)
            DispatchQueue.main.async {
                self.imageView.image = image
            }
        }
    }
}
