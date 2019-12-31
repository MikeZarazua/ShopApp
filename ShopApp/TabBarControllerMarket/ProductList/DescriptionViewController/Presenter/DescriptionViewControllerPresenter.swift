//
//  DescriptionViewControllerPresenter.swift
//  ShopApp
//
//  Created by Mike on 28/12/19.
//  Copyright © 2019 Mike. All rights reserved.
//

import Foundation

protocol DescriptionVCPresenterProtocol:class
{
    func showProductInitialData(productModel: InitialProductCellModel)
    func showProductRegistered(productModel:RegisterData)
    func showMessage(title: String, body: String)
}

class DescriptionViewControllerPresenter
{
    ///variables
    private weak var delegate: DescriptionVCPresenterProtocol?
    
}

//MARK: -  public methods
extension DescriptionViewControllerPresenter
{
    func setDelegate(vc: DescriptionVCPresenterProtocol)
    {
        self.delegate = vc
    }
    
    func setProductModel(product:MarketProductsCellsProtocol)
    {
        if let productModel = product as? InitialProductCellModel
        {
            self.delegate?.showProductInitialData(productModel: productModel)
        }else
        if let productRegistered = product as? RegisterData
        {
            self.delegate?.showProductRegistered(productModel: productRegistered)
        }
        else{
            self.delegate?.showMessage(title: "Error", body: "El producto no éxiste")
        }
    }
}
