//
//  InitialMarketViewController.swift
//  ShopApp
//
//  Created by Mike on 21/12/19.
//  Copyright © 2019 Mike. All rights reserved.
//

import UIKit

class InitialMarketViewController: UIViewController,Storyboarded
{
    ///Variables from
    @IBOutlet weak var tableView: UITableView!
    ///private variables
    private var dataSourceProducts: [MarketProductsCellsProtocol]?
    private var presenter = PresenterInitialMarket()
    //MARK: - View Controller Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        initTable()
        setPresenterDelegate()
        getProducts()
    }
    
    @IBAction func actionAddProduct(_ sender: Any) {
        let vc = AddProductViewController.instiantate()
        vc.delegate = self
        self.navigationController?.pushViewController(vc, animated: true)
    }
    override func viewDidAppear(_ animated: Bool)
    {
        super.viewDidAppear(animated)
        print("View did appear")
    }
}

//MARK: - Private methods
extension InitialMarketViewController
{
    /**
     This function inits the table view
     **/
    private func initTable()
    {
        tableView.delegate              = self
        tableView.dataSource            = self
        tableView.rowHeight             = UITableView.automaticDimension
        tableView.register(InitialProductTableViewCell.nib, forCellReuseIdentifier: InitialProductTableViewCell.identifier)
    }
    
    /**
     Get Data
     **/
    private func getProducts()
    {
        presenter.getDataSource()
    }
    
    ///Set delgate
    private func setPresenterDelegate()
    {
        presenter.setViewDelegate(viewDelegate: self)
    }
    
    
    private func showAlert(title: String, body: String)
    {
        UIAlert.showOkAlert(title: title, message: body, preferredControllerStyle: .alert, preferredAlertActionStyle: .default, viewController: self)
    }
    
}


extension InitialMarketViewController: UITableViewDelegate, UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        presenter.validateIfEmptyDataSource(dataSource: dataSourceProducts)
        return dataSourceProducts?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = UITableViewCell()
        
        if let customCell = tableView.dequeueReusableCell(withIdentifier: InitialProductTableViewCell.identifier, for: indexPath) as? InitialProductTableViewCell {
            customCell.model = dataSourceProducts?[indexPath.row]
            cell = customCell
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let modelProduct = dataSourceProducts?[indexPath.row] else{
            showAlert(title: "Error", body: "Producto no válido")
            return
        }
        let descriptionVC = DescriptionViewController.instiantate()
        descriptionVC.setProduct(product: modelProduct)
        self.navigationController?.pushViewController(descriptionVC, animated: true)
    }
    
    //MARK: - Delete with animation
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let delete = UITableViewRowAction(style: .destructive, title: "Borrar") { (action, indexPath) in
            // delete item at indexPath
            self.dataSourceProducts?.remove(at: indexPath.row)//remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
        // I wanted to add the option of share
//        let share = UITableViewRowAction(style: .normal, title: "Share") { (action, indexPath) in
//                   // share item at indexPath
//                   print("I want to share: \(self.dataSourceProducts?[indexPath.row])")
//               }
//
//        share.backgroundColor = UIColor.lightGray

        return [delete]
    }

}

//MARK: - initialMarketPresenterToViewProtocol delegate methods
extension InitialMarketViewController: InitialMarketPresenterToViewProtocol
{
    func showMesssage(title: String, body: String) {
        UIAlert.showOkAlert(title: title, message: body, preferredControllerStyle: .alert, preferredAlertActionStyle: .default, viewController: self)
    }
    
    func displayDataSource(dataSource: [MarketProductsCellsProtocol]) {
        self.dataSourceProducts = dataSource
        self.tableView.reloadData()
    }

}

//MARK: - AddproductViewController delegate methods
extension InitialMarketViewController: AddProductViewControllerProtocol
{
    func didAddProduct(product: MarketProductsCellsProtocol) {
        self.dataSourceProducts?.append(product)
        self.tableView.reloadData()
    }
}
