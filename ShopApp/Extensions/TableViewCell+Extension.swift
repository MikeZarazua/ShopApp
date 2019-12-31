//
//  TableViewCell+Extension.swift
//  ShopApp
//
//  Created by Mike on 22/12/19.
//  Copyright © 2019 Mike. All rights reserved.
//

import UIKit

extension UITableViewCell
{
    
    static var identifier: String
    {
        return String(describing: self)
    }
    
    static var nib: UINib
    {
        return UINib(nibName: identifier, bundle: Bundle.main)
    }
}
