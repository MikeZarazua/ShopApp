//
//  ValidatorFactory.swift
//  ShopApp
//
//  Created by Mike on 23/12/19.
//  Copyright © 2019 Mike. All rights reserved.
//

import Foundation

class ValidationError: Error {
    var message: String
    
    init(_ message: String) {
        self.message = message
    }
}

enum ValidatorType
{
    case productName
    case productPrice
    case productSKU
    case requiredField(field: String)
}


enum ValidatorFactory
{
    static func validatorFor(type: ValidatorType) -> ValidatorConvertible
    {
        switch type
        {
            case .productName: return ProductNameValidator()
            case .productPrice: return ProductPriceValidator()
            case .requiredField(let field): return RequiredFieldValidator(field)
            case .productSKU: return ProductSKUValidator()
        }
    }
    
}

struct ProductNameValidator: ValidatorConvertible
{
    func validated(value: String) throws -> String {
//        do
//        {
//            if try NSRegularExpression(pattern: RegexHelper.regexForOnlyLetters, options: .caseInsensitive).firstMatch(in: value, options: [], range: NSRange(location: 0, length: value.count)) == nil{
//                throw ValidationError("Nombre del producto no válido")
//            }
//        }catch
//        {
//            throw ValidationError("Nombre del producto no válido")
//        }
        return value
    }
}

struct ProductPriceValidator: ValidatorConvertible
{
    func validated(value: String) throws -> String
    {
        do
        {
            if try NSRegularExpression(pattern: RegexHelper.regexForOnlyNumber, options: .caseInsensitive).firstMatch(in: value, options: [], range: NSRange(location: 0, length: value.count)) == nil
            {
                throw ValidationError("Precio del producto no válido")
            }
        }catch
        {
            throw ValidationError("Precio del producto no válido")
        }
        return value
    }
}

struct ProductSKUValidator: ValidatorConvertible
{
    func validated(value: String) throws -> String
    {
        do
        {
            if try NSRegularExpression(pattern: RegexHelper.regexForSKU, options: .caseInsensitive).firstMatch(in: value, options: [], range: NSRange(location: 0, length: value.count)) == nil
            {
                throw ValidationError("SKU del producto no válido, No se aceptan números 0 o 1, o la letra I")
            }
        }catch
        {
            throw ValidationError("SKU del producto no válido, No se aceptan números 0 o 1, o la letra I")
        }
        return value
    }
}

struct RequiredFieldValidator: ValidatorConvertible
{
    private let fieldName: String
    
    init(_ field: String) {
        fieldName = field
    }
    
    func validated(value: String) throws -> String {
        guard !value.isEmptyOrWhitespace else {
            throw ValidationError("El campo " + fieldName + " es obligatorio")
        }
        return value
    }
}
