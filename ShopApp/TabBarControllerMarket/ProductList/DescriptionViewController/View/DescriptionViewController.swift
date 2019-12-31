//
//  DescriptionViewController.swift
//  ShopApp
//
//  Created by Mike on 28/12/19.
//  Copyright © 2019 Mike. All rights reserved.
//

import UIKit

class DescriptionViewController: UIViewController,Storyboarded {

    /// Variables
    @IBOutlet weak var labelProductName: UILabel!
    @IBOutlet weak var imageProduct: UIImageView!
    @IBOutlet weak var labelSKU: UILabel!
    @IBOutlet weak var labelPriceProduct: UILabel!
    @IBOutlet weak var labelDescription: UILabel!
    
    private let presenter = DescriptionViewControllerPresenter()
    private var product: MarketProductsCellsProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initUI()
        setDelegate()
        setProduct()
    }
}

//MARK: - public methods
extension DescriptionViewController
{
    func setProduct(product: MarketProductsCellsProtocol)
    {
        self.product = product
    }
}

//MARK:- private methods
extension DescriptionViewController
{
    private func setDelegate()
    {
        presenter.setDelegate(vc: self)
    }
    
    private func setProduct()
    {
        guard let product = self.product else{
            print("couldnt set let product = self.product")
            return
        }
        self.presenter.setProductModel(product: product)
    }
    
    /**
     setcolors for labels
     **/
    private func initUI()
    {
        self.labelPriceProduct.textColor = UIColor.CustomColors.colorPriceCell
        self.labelSKU.textColor          = UIColor.CustomColors.colorSKUCell
        self.labelProductName.textColor  = UIColor.CustomColors.colorTitleCell
        self.labelDescription.textColor  = UIColor.CustomColors.colorTitleCell
    }

}

//MARK: - DescriptionVCPresenterProtocol delegate methods
extension DescriptionViewController: DescriptionVCPresenterProtocol
{
    func showProductInitialData(productModel: InitialProductCellModel) {
        self.labelProductName.text    = productModel.productName
        self.labelSKU.text            = "SKU: \(productModel.productSKU)"
        self.labelPriceProduct.text   = "$\(productModel.productPrice)"
        self.labelDescription.text    = productModel.description
        if let imagePath = Bundle.main.path(forResource: productModel.imageName, ofType: productModel.extensionFile)//pathForImageResource(model.imageName+".jpeg")
        {
            self.imageProduct.image    = UIImage(contentsOfFile: imagePath)
        }
    }
    
    func showProductRegistered(productModel: RegisterData) {
        self.labelProductName.text  = productModel.productName
        self.imageProduct.image     = productModel.principalImage
        self.labelSKU.text          = "SKU: \(productModel.productSKU)"
        self.labelPriceProduct.text = "$\(productModel.productPrice)"
        self.labelDescription.text  = productModel.productDescription
    }
    
    func showMessage(title: String, body: String) {
        UIAlert.showOkAlert(title: title, message: body, preferredControllerStyle: .alert, preferredAlertActionStyle: .default, viewController: self)
    }
    
    
}
