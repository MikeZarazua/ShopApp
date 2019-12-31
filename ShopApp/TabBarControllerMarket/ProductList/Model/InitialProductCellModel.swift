//
//  InitialProductCellModel.swift
//  ShopApp
//
//  Created by Mike on 21/12/19.
//  Copyright © 2019 Mike. All rights reserved.
//

import Foundation

class InitialProductCellModel: MarketProductsCellsProtocol
{
    var productName     : String
    var productPrice    : String
    var productSKU      : String
    var imageName       : String
    var extensionFile   : String
    var description     : String
    
    init(productName: String, productPrice: String, productSKU: String, imageName: String, extensionFile: String, description: String)
    {
        self.productName    = productName
        self.productPrice   = productPrice
        self.productSKU     = productSKU
        self.imageName      = imageName
        self.extensionFile  = extensionFile
        self.description    = description
    }
}

