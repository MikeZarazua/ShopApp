//
//  UITextField+Extension.swift
//  ShopApp
//
//  Created by Mike on 23/12/19.
//  Copyright © 2019 Mike. All rights reserved.
//

import Foundation

extension String {
    var isEmptyOrWhitespace : Bool {
        return self.trimmingCharacters(in: .whitespaces).isEmpty
    }
}
