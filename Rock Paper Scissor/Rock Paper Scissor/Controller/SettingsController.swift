//
//  SettingsController.swift
//  Rock Paper Scissor
//
//  Created by Nakia Crumbo on 5/9/24.
//

import UIKit

class SettingsController: UIViewController {
    
    
    @IBOutlet weak var settingLabel: UILabel!
    @IBOutlet weak var ldmLabel: UILabel!

    @IBOutlet weak var lightSwitch: UISwitch!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    @IBAction func lightSwitchChanged(_ sender: UISwitch) {
        if sender.isOn {
            // Dark mode is disabled
            disableDarkMode()
            
            } else {
                // Dark mode is enabled
                enableDarkMode()
            }
    }
    
    // Enable dark mode
    func enableDarkMode() {
        UIApplication.shared.windows.forEach { window in
            window.overrideUserInterfaceStyle = .light
        }
            
    }

    // Disable dark mode
    func disableDarkMode() {
        UIApplication.shared.windows.forEach { window in
            window.overrideUserInterfaceStyle = .dark
        }

    }
    
   
    
    
    
}
