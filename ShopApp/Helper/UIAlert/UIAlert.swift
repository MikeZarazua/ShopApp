//
//  UIAlert+.swift
//  ShopApp
//
//  Created by Mike on 26/12/19.
//  Copyright © 2019 Mike. All rights reserved.
//

import Foundation
import UIKit

class UIAlert
{
    static func showActionsheet(viewController: UIViewController, title: String, message: String,preferredStyle: UIAlertController.Style ,actions: [(String, UIAlertAction.Style)], completion: @escaping (_ index: Int) -> Void)
    {
        //Create the UIAlertController
        let alertViewController = UIAlertController(title: title, message: message, preferredStyle: preferredStyle)
        //iterate through every action and add as option to the alertViewController
        for (index, (title, style)) in actions.enumerated()
        {
            let alertAction = UIAlertAction(title: title, style: style)
            { (_) in
                completion(index)
            }
            alertViewController.addAction(alertAction)
        }
        
        ///if the message is on an iPad device
        if preferredStyle == .actionSheet
        {
            if let popoverController = alertViewController.popoverPresentationController {
                popoverController.sourceView = viewController.view
                popoverController.sourceRect = CGRect(x: viewController.view.bounds.midX, y: viewController.view.bounds.midY, width: 0, height: 0)
                popoverController.permittedArrowDirections = []
            }
        }
        viewController.present(alertViewController, animated: true, completion: nil)
    }
    
    //MARK: - Native UIAlertController
    public static func showOkAlert(title:String?,message:String?,preferredControllerStyle:UIAlertController.Style, preferredAlertActionStyle:UIAlertAction.Style,viewController:UIViewController, buttonMessage:String = "Aceptar")
    {
        let alert = UIAlertController(title: title, message: message, preferredStyle: preferredControllerStyle)
        alert.addAction(UIAlertAction(title: buttonMessage, style: preferredAlertActionStyle, handler: nil))
        
        viewController.present(alert, animated: true)
    }
}
