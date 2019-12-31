//
//  ButtonTableViewCell.swift
//  ShopApp
//
//  Created by Mike on 24/12/19.
//  Copyright © 2019 Mike. All rights reserved.
//

import UIKit

protocol ButtonProtocol: class
{
    func didPressAddButton()
}

class ButtonTableViewCell: UITableViewCell {

    @IBOutlet weak var buttonDone: NSLayoutConstraint!
    weak var delegate: ButtonProtocol?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func actionDoneButton(_ sender: Any) {
        self.delegate?.didPressAddButton()
    }
}
