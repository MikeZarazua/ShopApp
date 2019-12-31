//
//  AddPorductPresenter.swift
//  ShopApp
//
//  Created by Mike on 23/12/19.
//  Copyright © 2019 Mike. All rights reserved.
//

import Foundation

//Presenter -> View protocol
protocol AddProductPresenterToViewProtocol: class
{
    func didFinishAddingProduct()
    func loadedViewComponents(dataSource:[AddProductProtocol])
    func setNewProduct(model: MarketProductsCellsProtocol)
    func showMessage(title:String, body: String)
}

class AddProductPresenter
{
    //MARK: - variables
    private weak var delegate: AddProductPresenterToViewProtocol?
    
    func setDelegateView(view: AddProductPresenterToViewProtocol)
    {
        self.delegate = view
    }
    
}

//MARK: - Public methods
extension AddProductPresenter
{
    /**
     This method load the view
     **/
    func loadViewComponents()
    {
        var dataSource = [AddProductProtocol]()
        
        let productNameField = AddProductModelItem(inputData: "", cellType: .textField, cellSubtype: .productName, obligatory: true, title: "*Nombre del producto", errorMessage: "This field is obligatory", keyboardInputType: .default)
        let productSKUField = AddProductModelItem(inputData: "", cellType: .textField, cellSubtype: .productSKU, obligatory: true, title: "SKU Producto, ejemplo: EFER-efrg-234-MIKE", errorMessage: "This field is bligatory",keyboardInputType: .default)
        let productPriceField = AddProductModelItem(inputData: "", cellType: .textField, cellSubtype: .productPrice, obligatory: true, title: "*Precio", errorMessage: "The product price is obligatory", keyboardInputType: .numberPad)
        let poductDescription = AddProductModelItem(inputData: "", cellType: .textView, cellSubtype: .productDescription, obligatory: false, title: "Descripción", errorMessage: "",keyboardInputType: .default)
        let productStock = AddProductModelItem(inputData: "", cellType: .textField, cellSubtype: .productStock, obligatory: true, title: "*Stock", errorMessage: "", keyboardInputType: .numberPad)
        let productImage = AddProductImageModelItem(cellType: .image, cellSubtype: .noValidation, inputData: "", imagePrincipal: UIImage(named: "file")!)
        let buttonDone = AddProductButtonModelItem(cellType: .button, cellSubtype: .noValidation, inputData: "")
        
        dataSource.append(productNameField)
        dataSource.append(productSKUField)
        dataSource.append(productPriceField)
        dataSource.append(poductDescription)
        dataSource.append(productStock)
        dataSource.append(productImage)
        dataSource.append(buttonDone)
        self.delegate?.loadedViewComponents(dataSource: dataSource)
    }
    
    
    
    /**
     This function evaluates the input that the user set
     **/
    func validateInput(dataSource: [AddProductProtocol])
    {
        do{
            var productName : String?
            var productPrice: String?
            var productStock: String?
            var productSKU  : String?
            var image       = UIImage()
            var productDesc : String?
            for model in dataSource
            {
                switch model.cellType {
                case .textField:
                    switch model.cellSubtype
                    {
                        case .productName:
                            print(model.inputData)
                            productName = try model.validatedText(validatorType: ValidatorType.requiredField(field: "Nombre"))
                        case .productPrice:
                            productPrice = try model.validatedText(validatorType: ValidatorType.productPrice)
                        case .productSKU:
                            productSKU = try model.validatedText(validatorType: ValidatorType.productSKU)
                        case .productStock:
                            productStock = try model.validatedText(validatorType: ValidatorType.requiredField(field: "Stock"))
                        default:
                            print("This field doesn't need a validation")
                    }
                case .textView:
                      productDesc      = try model.validatedText(validatorType: ValidatorType.requiredField(field: "Desc"))
                case .image:
                        if let model = model as? AddProductImageModelItem
                        {
                            image = model.imagePrincipal
                        }
                default:
                    print("No validate")
                }
            }
            let data = RegisterData(productName: productName ?? "No name", productPrice: productPrice ?? "", productStock: productStock ?? "", productSKU: productSKU ?? "", productDescription: productDesc ?? "", principalImage: image)

            saveProduct(productData: data)
        }catch let error{
            print("Error with \(error.localizedDescription)")
            if let error = error as? ValidationError
            {
                print(error.message)
                self.delegate?.showMessage(title: "Error", body: error.message)
            }
        }
    }
    
//    showAlert(for: (error as! ValidationError).message)

    /**
     This function validate the input that is provided by the AddProductProtocol cellSubtype
     **/
    func validateSubType(model: AddProductProtocol)
    {
        do{
            var productName : String?
            var productPrice: String?
            var productStock: String?
            var productSKU  : String?
            var productDesc : String?
            switch model.cellSubtype
            {
                case .productName:
                    productName      = try model.validatedText(validatorType: ValidatorType.productName)
                case .productPrice:
                    productPrice     = try model.validatedText(validatorType: ValidatorType.productPrice)
                case .productSKU:
                    productSKU       = try model.validatedText(validatorType: ValidatorType.requiredField(field: "SKU"))
                case .productStock:
                    productStock     = try model.validatedText(validatorType: ValidatorType.requiredField(field: "Stock"))
                case .productDescription:
                    productDesc      = try model.validatedText(validatorType: ValidatorType.requiredField(field: "Desc"))
                default:
                    print("This field doesn't need a validation")
            }
     
            if let model = model as? AddProductImageModelItem
            {
                
            }
            let data = RegisterData(productName: productName ?? "No name", productPrice: productPrice!, productStock: productStock!, productSKU: productSKU!, productDescription: productDesc!, principalImage: UIImage())
        }catch {
            
        }
    }
}

//MARK: - Private methods
extension AddProductPresenter
{
    /**
     This function generate the object that represents the product to show
     **/
    private func saveProduct(productData:MarketProductsCellsProtocol)
    {
        self.delegate?.setNewProduct(model: productData)
    }
}


import UIKit
class RegisterData: MarketProductsCellsProtocol {
    var productName         : String
    var productPrice        : String
    var productStock        : String
    var productSKU          : String
    var productDescription  : String
    var principalImage      : UIImage
    
    init(productName: String,productPrice: String, productStock: String, productSKU: String, productDescription: String ,principalImage: UIImage)
    {
        self.productName        = productName
        self.productPrice       = productPrice
        self.productStock       = productStock
        self.productSKU         = productSKU
        self.principalImage     = principalImage
        self.productDescription = productDescription
    }
}



