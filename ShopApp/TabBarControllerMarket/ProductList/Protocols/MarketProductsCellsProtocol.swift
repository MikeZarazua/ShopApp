//
//  MarketProductsCellsProtocol.swift
//  ShopApp
//
//  Created by Mike on 21/12/19.
//  Copyright © 2019 Mike. All rights reserved.
//

import Foundation


protocol MarketProductsCellsProtocol: class
{
    var productName: String { get set }
    var productPrice: String { get set }
    var productSKU: String   { get set }
}
