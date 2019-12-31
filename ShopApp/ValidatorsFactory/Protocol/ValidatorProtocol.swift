//
//  ValidatorProtocol.swift
//  ShopApp
//
//  Created by Mike on 23/12/19.
//  Copyright © 2019 Mike. All rights reserved.
//

import Foundation

//MARK: - Every class that will evlaautean input must implement this protocol
protocol ValidatorConvertible
{
    /**
     This funciton return a throws as String
     - Receive value: The string value to evaluate
     **/
    func validated(value: String) throws -> String
}
