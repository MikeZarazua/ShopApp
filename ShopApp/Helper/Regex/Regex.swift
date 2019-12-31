//
//  Regex.swift
//  ShopApp
//
//  Created by Mike on 23/12/19.
//  Copyright © 2019 Mike. All rights reserved.
//

import Foundation

class RegexHelper
{
    static let regexForOnlyNumber: String = "^[0-9]*$"
    static let regexForOnlyLetters: String = "[^A-Za-z].*$"
    static let regexForSKU: String         = "^([A-H-J-Za-z]){4}-([a-z]){4}-([2-9]){3}-MIKE$"
}
