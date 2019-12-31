//
//  File.swift
//  ShopApp
//
//  Created by Mike on 22/12/19.
//  Copyright © 2019 Mike. All rights reserved.
//

import Foundation
import UIKit

enum CellSubType
{
    case productName
    case productSKU
    case productPrice
    case productDescription
    case productStock
    case noValidation
}

enum CellType: Int
{
    case textField   = 0
    case textView    = 1
    case button      = 2
    case image       = 3
}

protocol AddProductProtocol
{
    var cellType:       CellType    {get set}
    var cellSubtype:    CellSubType {get set}
//    var title:          String      {get set}
//    var errorMessage:   String      {get set}
    var inputData:      String      {get set}
}


extension AddProductProtocol
{
    func validatedText(validatorType:ValidatorType) throws -> String
    {
        let validator = ValidatorFactory.validatorFor(type: validatorType)
        return try validator.validated(value: self.inputData)
    }
}

class AddProductModelItem: AddProductProtocol
{
    var keyboardInputType: UIKeyboardType
    var inputData: String
    var cellType: CellType
    var cellSubtype: CellSubType
    var obligatory: Bool
    var title: String
    var errorMessage: String
    
    init(inputData: String, cellType: CellType, cellSubtype: CellSubType, obligatory: Bool, title: String, errorMessage: String, keyboardInputType: UIKeyboardType)
    {
        self.keyboardInputType = keyboardInputType
        self.inputData     = inputData
        self.cellType      = cellType
        self.cellSubtype   = cellSubtype
        self.obligatory    = obligatory
        self.title         = title
        self.errorMessage  = errorMessage
    }
}


class AddProductButtonModelItem: AddProductProtocol
{
    var cellType: CellType
    var cellSubtype: CellSubType
    var inputData: String
    
    init(cellType: CellType, cellSubtype: CellSubType, inputData: String) {
        self.cellType    =  cellType
        self.cellSubtype = cellSubtype
        self.inputData   = inputData
    }
}

import UIKit
class AddProductImageModelItem: AddProductProtocol
{
    var cellType: CellType
    var cellSubtype: CellSubType
    var inputData: String
    var imagePrincipal: UIImage
    
    init(cellType: CellType, cellSubtype: CellSubType, inputData: String, imagePrincipal: UIImage)
    {
        self.cellSubtype    = cellSubtype
        self.cellType       = cellType
        self.inputData      = inputData
        self.imagePrincipal = imagePrincipal
    }
        
}
