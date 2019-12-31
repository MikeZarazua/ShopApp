//
//  InitialProductTableViewCell.swift
//  ShopApp
//
//  Created by Mike on 21/12/19.
//  Copyright © 2019 Mike. All rights reserved.
//

import UIKit

class InitialProductTableViewCell: UITableViewCell {

    @IBOutlet weak var buttonOptions: UIButton!
    @IBOutlet weak var labelProductPrice: UILabel!
    @IBOutlet weak var labelProductSKU: UILabel!
    @IBOutlet weak var labelProductName: UILabel!
    @IBOutlet weak var imagePrincipal: UIImageView!
    
    
    var model: MarketProductsCellsProtocol?
    {
        didSet
        {
            if let model = model as? InitialProductCellModel{
                setModelAttributes(model: model)
            }else
            if let model = model as? RegisterData
            {
                setRegisteredModelAttributes(model: model)
            }
        }
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        //cusotm labels
        initUI()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}


//MARK: - Private methods
extension InitialProductTableViewCell
{
    
    /**
     setcolors for labels
     **/
    private func initUI()
    {
        self.labelProductPrice.textColor = UIColor.CustomColors.colorPriceCell
        self.labelProductSKU.textColor   = UIColor.CustomColors.colorSKUCell
        self.labelProductName.textColor  = UIColor.CustomColors.colorTitleCell
    }
    
    private func setModelAttributes(model: InitialProductCellModel)
    {
        self.labelProductPrice.text  = model.productPrice
        self.labelProductSKU.text    = "SKU: \(model.productSKU)"
        self.labelProductName.text   = model.productName
        
        if let imagePath = Bundle.main.path(forResource: model.imageName, ofType: model.extensionFile)//pathForImageResource(model.imageName+".jpeg")
        {
            self.imagePrincipal.image    = UIImage(contentsOfFile: imagePath)
        }
    }
    
    private func setRegisteredModelAttributes(model: RegisterData)
    {
        self.labelProductPrice.text  = model.productPrice
        self.labelProductSKU.text    = "SKU: \(model.productSKU)"
        self.labelProductName.text   = model.productName
        self.imagePrincipal.image    = model.principalImage
    }
}
