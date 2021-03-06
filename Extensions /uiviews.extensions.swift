//
//  uiviews.extensions.swift
//  covidTracker



import Foundation
import UIKit

extension UILabel  {
    func beautify(indexpath : Int) {
        self.layer.borderWidth = 1.0
        self.layer.borderColor =  (indexpath % 2 == 0 ) ? UIColor.black.cgColor  : UIColor.white.cgColor
        self.textAlignment = .center
        self.adjustsFontSizeToFitWidth = true
        self.textColor = (indexpath % 2 == 0 ) ? UIColor.black : UIColor.white
    }
    func beautifyII() {
        self.layer.borderWidth = 1.0
        self.layer.borderColor =  UIColor.white.cgColor
        self.textAlignment = .center
        self.adjustsFontSizeToFitWidth = true
        self.textColor = UIColor.black
        self.backgroundColor = .systemBlue
        self.textColor = .white
    }
    
    func beautifyIII() {
           self.textAlignment = .center
           self.adjustsFontSizeToFitWidth = true
           self.textColor = UIColor.black
           self.backgroundColor = .systemBlue
           self.textColor = .white
       }
    
}

extension UIImageView {
    func beautifty() {
        self.layer.borderWidth = 2
        self.layer.borderColor = UIColor.systemOrange.cgColor
        self.layer.masksToBounds = false
        self.layer.cornerRadius = self.frame.height/2
        self.clipsToBounds = true
        self.contentMode = .scaleAspectFill
    }
}

