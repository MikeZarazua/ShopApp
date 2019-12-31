//
//  ImageTableViewCell.swift
//  ShopApp
//
//  Created by Mike on 23/12/19.
//  Copyright © 2019 Mike. All rights reserved.
//

import UIKit
import Photos

protocol ImageViewCellProtocol:NSObjectProtocol
{
    func dismissPicker()
    func showAlert(title:String,body:String)
    func didSelectItem(at indexPath: IndexPath, with actions: [(String, UIAlertAction.Style)])
    func syncMultimedias(didSync:Bool, withMultimediasString: String)
    func showOptions()
}

class ImageTableViewCell: UITableViewCell
{
    weak var viewConrollerReference: UIViewController?
    @IBOutlet weak var principalImage: UIImageView!

    
    var model: AddProductProtocol?
    {
        didSet
        {
            guard let model = model as? AddProductImageModelItem else{
                print("couldnt set  let model = model as? AddProductImageModelItem ")
                return
            }
            
            self.principalImage.image = model.imagePrincipal
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setActionToView()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setViewController(vc: UIViewController)
    {
        self.viewConrollerReference = vc
    }
    
}


////MARK: - PhotoLibrary delegate methods
extension ImageTableViewCell: UIImagePickerControllerDelegate,UINavigationControllerDelegate
{
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        //Did cancel selection
        self.viewConrollerReference?.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let image    = info[UIImagePickerController.InfoKey.originalImage] as? UIImage
        self.principalImage.image = image
        guard let model = self.model as? AddProductImageModelItem else{
            print("couldnt set  let model = model as? AddProductImageModelItem ")
            return
        }
        model.imagePrincipal = principalImage.image!
        self.viewConrollerReference?.dismiss(animated: true, completion: nil)
    }
    
}


//MARK: - Private methods
extension ImageTableViewCell
{
    /**
     This method only whow the options for camera or photo library selection
     **/
    private func showOptions()
    {
        //get the reference to the view
        guard let vc = viewConrollerReference else {
            print("Couldnt set  let vc = viewConrollerReference")
            return
        }
        var actions: [(String, UIAlertAction.Style)] = []
        actions.append(("Camera",UIAlertAction.Style.default))
        actions.append(("Photo",UIAlertAction.Style.default))

        UIAlert.showActionsheet(viewController: vc, title: "Options", message: "", preferredStyle: .actionSheet, actions: actions) { (option) in
            switch option
            {
                case 0:
                //case camera
                print("Ask permiison for camera")
                self.pickerOption(sourceType: .camera)
                case 1:
                //case photo
                print("Ask permiison for phto")
                self.pickerOption(sourceType: .photoLibrary)
                default:
                print("Doesnt exist optino")
                
            }
        }
    }
    
    /**
     Loads the picker for the sourceType, receives
     - Parameter sourceType: UIImagePickerController.SourceType that could be camera or photoLabrary
     **/
    private func pickerOption(sourceType: UIImagePickerController.SourceType)
    {
        if UIImagePickerController.isSourceTypeAvailable(sourceType) {
            let imagePickerController = UIImagePickerController()
            imagePickerController.delegate = self
            imagePickerController.sourceType = sourceType
            
            //get the reference to the view
            guard let vc = viewConrollerReference else {
                print("Couldnt set  let vc = viewConrollerReference")
                return
            }
            vc.present(imagePickerController, animated: true, completion: nil)
        }
    }
    
    /**
     Set the action to the principla UIImageView
     **/
    private func setActionToView()
    {
        let tapGestureRegognizer = UITapGestureRecognizer(target: self, action: #selector(imageTapped(tapGestureRecognizer:)))
        self.principalImage.isUserInteractionEnabled = true
        self.principalImage.addGestureRecognizer(tapGestureRegognizer)
    }
    
    @objc private func imageTapped(tapGestureRecognizer: UITapGestureRecognizer)
    {
        showOptions()
    }

}


func saveToDocument(documentDirectory: URL,image: UIImage) -> URL
{
    let imageFolder = documentDirectory
    let imageURL    = imageFolder.appendingPathComponent("zh_\(generateTimeStamp()).jpeg")
    let jpegData    = image.jpegData(compressionQuality: 0.75)
    do{
        try jpegData?.write(to: imageURL)
    }catch let error
    {
        print("Error writing file in \(imageURL) wit error: \(error)")
    }
    return imageURL
}

func generateTimeStamp() -> String
{
    return String(Int(Date().timeIntervalSince1970))
}
