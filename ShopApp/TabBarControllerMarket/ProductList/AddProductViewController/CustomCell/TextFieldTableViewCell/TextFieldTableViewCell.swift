//
//  TextFieldTableViewCell.swift
//  ShopApp
//
//  Created by Mike on 22/12/19.
//  Copyright © 2019 Mike. All rights reserved.
//

import UIKit

class TextFieldTableViewCell: UITableViewCell {
    
    //MARK: -  variables
    ///IBOutlets
    @IBOutlet var labelTitle: UILabel!
    @IBOutlet var textFieldInput: UITextField!
    @IBOutlet var labelErrorMessage: UILabel!
    
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

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.textFieldInput.delegate = self
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}


//MARK: - Private methods
extension TextFieldTableViewCell
{
    /**
     This function set the models
     **/
    private func setModelConfig(model: AddProductModelItem)
    {
        self.labelTitle.text              = model.title
        self.textFieldInput.text          = model.inputData
        self.textFieldInput.keyboardType  = model.keyboardInputType
//        self.labelErrorMessage.text = model.validatedText(validatorType:  )
    }
}

//MARK: TextFielddelegat methods
extension TextFieldTableViewCell: UITextFieldDelegate
{
    func textFieldDidEndEditing(_ textField: UITextField) {
        self.model?.inputData = textField.text ?? ""
    }
}

