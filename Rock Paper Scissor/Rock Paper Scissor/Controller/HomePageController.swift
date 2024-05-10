//
//  HomePageController.swift
//  Rock Paper Scissor
//
//  Created by Nakia Crumbo on 5/2/24.
//

import UIKit

class HomePageController: UIViewController {
    
    
    @IBOutlet weak var homestartButton: UILabel!
    
    @IBOutlet weak var settingsButton: UIBarButtonItem!
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Add tap gesture recognizer to the homestartButton label
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(startButtonTapped(_:)))
        homestartButton.isUserInteractionEnabled = true
        homestartButton.addGestureRecognizer(tapGestureRecognizer)
        
        
        
    }
    
    @IBAction func settingsButtonTapped(_ sender: Any) {
        // Instantiate the settings view controller from storyboard
            if let settingsViewController = storyboard?.instantiateViewController(withIdentifier: "toSettingsController") {
                navigationController?.pushViewController(settingsViewController, animated: true)
            }
    }
    
    
    
    
    // Function to handle tap on the homestartButton label
    @objc func startButtonTapped(_ sender: UITapGestureRecognizer) {
    // Perform navigation to the ViewController
    performSegue(withIdentifier: "ViewController", sender: nil)
    
    }
    
   
    
    
}
