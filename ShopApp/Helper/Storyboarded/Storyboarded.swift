//
//  Storyboarded.swift
//  ShopApp
//
//  Created by Mike on 21/12/19.
//  Copyright © 2019 Mike. All rights reserved.
//

import UIKit

protocol Storyboarded
{
    static func instiantate() -> Self
}

extension Storyboarded where Self: UIViewController
{
    static func instiantate() -> Self
    {
        // get viewController file name with extension
        let fullName  = NSStringFromClass(self)
        // get only the name after split by a dot
        let className = fullName.components(separatedBy: ".")[1]
        // load the storyboard with the same Name
        let storyboard = UIStoryboard(name: className, bundle: Bundle.main)
        // return the view controller with uicomponents loaded
        return storyboard.instantiateViewController(withIdentifier: className) as! Self
    }
}
