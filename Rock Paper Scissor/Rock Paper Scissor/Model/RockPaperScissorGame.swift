//
//  RockPaperScissorGame.swift
//  Rock Paper Scissor
//
//  Created by Nakia Crumbo on 5/8/24.
//

import Foundation
import UIKit



class RockPaperScissorGame {
    
// this is the Model section of the MVC design for handling of the methods-functions so they can be called from the ViewControllers, although transferring all functions would to much and break the code when readjusting variables, alerts, etc. within the amount of time left for this project. I will leave pre-existing code alone and only implement new functions code here to be called in ViewControllers.
    
    
    
    func lightDarkMode() {
            
            let shouldEnableDarkMode = true
            
            let settingsController = SettingsController()
            if shouldEnableDarkMode {
                settingsController.enableDarkMode()
            } else {
                settingsController.disableDarkMode()
            }
        }
    
    
    
    
    
    
    
    
    
    
}

