//
//  ViewController.swift
//  I Can Do This
//
//  Created by Nakia Crumbo on 3/1/24.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func clickbutton(_ sender: Any) {
        
        imageView.image = UIImage(named: "Lions2")
        
        print("change clicked")
        
    }
    
}


