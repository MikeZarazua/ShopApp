//
//  TextViewTableViewCell.swift
//  ShopApp
//
//  Created by Mike on 22/12/19.
//  Copyright © 2019 Mike. All rights reserved.
//

import UIKit

class TextViewTableViewCell: UITableViewCell {
    //MARK: -Variables
    var model: AddProductProtocol?
    {
        didSet
        {
            guard let model = model as? AddProductModelItem else{
                print("Error couldn't set let model = model as? AddProductModelItem")
                return
            }
            setModelConfig(model: model)
            
        }
    }
    
    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var textViewDescription: UITextView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        textViewDescription.delegate = self
        configUI()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}


//MARK: - private methods
extension TextViewTableViewCell
{
    private func setModelConfig(model: AddProductModelItem){
        self.labelTitle.text                     = model.title
        self.textViewDescription.text            = model.inputData
        self.textViewDescription.keyboardType    = model.keyboardInputType

    }
    
    private func configUI()
    {
        textViewDescription.clipsToBounds = true
        textViewDescription.layer.cornerRadius = 10.0
        textViewDescription.layer.borderWidth = 1.2
        textViewDescription.layer.borderColor = UIColor.lightGray.cgColor
    }
}


extension TextViewTableViewCell: UITextViewDelegate
{
    func textViewDidEndEditing(_ textView: UITextView) {
        self.model?.inputData = textView.text
    }
}
