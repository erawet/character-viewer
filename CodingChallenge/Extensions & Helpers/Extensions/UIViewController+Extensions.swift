//
//  UIViewController+Extensions.swift
//  CodingChallenge
//  Created by Don Wettasinghe on 04/25/23.

import Foundation
import UIKit

extension UIViewController {
    /**
     Shows a `UIAlertController` with the provided title, message, and style.
     
     - Parameter title: The title to show in the `UIAlertController`
     - Parameter message: The message to show in the `UIAlertController`
     - Parameter style: The Preferred Style for the `UIAlertController`. Default is `UIAlertController.Style.alert`
     */
    func showDefaultAlert(title: String, message: String, style: UIAlertController.Style = .alert) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: style)
        
        let okayAction = UIAlertAction(title: "Okay", style: .default, handler: nil)
        alertController.addAction(okayAction)
        
        self.present(alertController, animated: true, completion: nil)
    }
}
