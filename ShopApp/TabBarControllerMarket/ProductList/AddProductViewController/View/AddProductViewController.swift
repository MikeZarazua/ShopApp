//
//  AddProductViewController.swift
//  ShopApp
//
//  Created by Mike on 22/12/19.
//  Copyright © 2019 Mike. All rights reserved.
//

import UIKit

protocol AddProductViewControllerProtocol:class {
    func didAddProduct(product: MarketProductsCellsProtocol)
}

class AddProductViewController: UIViewController, Storyboarded {    
    //MARK: - Private var
    @IBOutlet var tableView: UITableView!
    private let presenter = AddProductPresenter()
    var dataSourceFields: [AddProductProtocol] = [AddProductProtocol]()
    weak var delegate: AddProductViewControllerProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initTable()
        setDelegate()
        loadFields()
        // Do any additional setup after loading the view.
    }
    
    func setViewControllerDelegate(vc: AddProductViewControllerProtocol)
    {
        self.delegate = vc
    }

}

//MARK: - Private methods
extension AddProductViewController
{
    /**
     Init the tableView
     **/
    private func initTable()
    {
        self.tableView.delegate         = self
        self.tableView.dataSource       = self
        self.tableView.allowsSelection  = false
        self.tableView.rowHeight        = UITableView.automaticDimension
        self.tableView.register(TextFieldTableViewCell.nib, forCellReuseIdentifier: TextFieldTableViewCell.identifier)
        self.tableView.register(TextViewTableViewCell.nib, forCellReuseIdentifier: TextViewTableViewCell.identifier)
        self.tableView.register(ImageTableViewCell.nib, forCellReuseIdentifier: ImageTableViewCell.identifier)
        self.tableView.register(ButtonTableViewCell.nib, forCellReuseIdentifier: ButtonTableViewCell.identifier)
    }
    
    /**
     This funcitons et the delegate to the presenter
     **/
    private func setDelegate()
    {
        self.presenter.setDelegateView(view: self)
    }
    
    /**
     This function loads the textfields inputs
     **/
    private func loadFields()
    {
        self.presenter.loadViewComponents()
    }
    
    private func popView()
    {
        self.navigationController?.popViewController(animated: true)
    }
}


//MARK: - TableView delegate and datasource methods
extension AddProductViewController: UITableViewDelegate, UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSourceFields.count 
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = UITableViewCell()
        let model = dataSourceFields[indexPath.row]
        
        switch model.cellType
        {
            
        case .textField:
            guard let customCell = tableView.dequeueReusableCell(withIdentifier: TextFieldTableViewCell.identifier, for: indexPath) as? TextFieldTableViewCell else {
                print("Couldnt set let customCell = tableView.dequeueReusableCell(withIdentifier: TextFieldTableViewCell.identifier, for: indexPath) as? TextFieldTableViewCell")
                return cell
            }
            customCell.model = model
            cell = customCell
        case .textView:
            guard let customCell = tableView.dequeueReusableCell(withIdentifier: TextViewTableViewCell.identifier, for: indexPath) as? TextViewTableViewCell else {
                print("Couldnt set let customCell = tableView.dequeueReusableCell(withIdentifier: TextFieldTableViewCell.identifier, for: indexPath) as? TextFieldTableViewCell")
                return cell
            }
            customCell.model = model
            cell = customCell
        case .button:
            guard let customCell = tableView.dequeueReusableCell(withIdentifier: ButtonTableViewCell.identifier, for: indexPath) as? ButtonTableViewCell else
            {
                print("Couldn't set let customCell = tableView.dequeueReusableCell(withIdentifier: ButtonTableViewCell.identifier, for: indexPath) as? ButtonTableViewCell else")
                return cell
            }
            customCell.delegate = self
            cell = customCell
        case .image:
            guard let customCell = tableView.dequeueReusableCell(withIdentifier: ImageTableViewCell.identifier, for: indexPath) as? ImageTableViewCell else
            {
                print("Couldn't set let customCell = tableView.dequeueReusableCell(withIdentifier: ImageTableViewCell.identifier, for: indexPath) as? ImageTableViewCell ")
                return cell
            }
            customCell.model = model
            customCell.setViewController(vc: self)
            cell = customCell
        }
        
        return cell
    }
}


//MARK: -  AddProductPresenterToViewProtocol delegate methods
extension AddProductViewController: AddProductPresenterToViewProtocol
{
    func didFinishAddingProduct() {
        print("did finish adding product")
    }
    
    func loadedViewComponents(dataSource: [AddProductProtocol]) {
        self.dataSourceFields = dataSource
    }
    
    func setNewProduct(model: MarketProductsCellsProtocol)
    {
        self.delegate?.didAddProduct(product: model)
        popView()
    }
    
    func showMessage(title:String, body: String)
    {
        UIAlert.showOkAlert(title: title, message: body, preferredControllerStyle: .alert, preferredAlertActionStyle: .default, viewController: self)
    }
}

//MARK: - ButtonProtocol Delegat emethod
extension AddProductViewController: ButtonProtocol
{
    func didPressAddButton() {
        //
        self.presenter.validateInput(dataSource: self.dataSourceFields)
    }
}

