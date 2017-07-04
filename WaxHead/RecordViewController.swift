//
//  RecordViewController.swift
//  WaxHead
//
//  Created by Joshua Martin on 6/16/17.
//  Copyright © 2017 Joshua Martin. All rights reserved.
//

import UIKit

class RecordViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {


    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var recordImageView: UIImageView!
    
    var imagePicker = UIImagePickerController()
    var record : Record? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imagePicker.delegate = self
        
        if record != nil {
            recordImageView.image = UIImage(data: record?.image as! Data)
            titleTextField.text = record?.title
        } else {
            print("oh dagnabit bois that aint a record")
        }
    }

    
    @IBAction func photosTapped(_ sender: Any) {
    imagePicker.sourceType = .photoLibrary
    
        present(imagePicker, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        let image = info[UIImagePickerControllerOriginalImage] as! UIImage
        
        recordImageView.image = image
        recordImageView.alpha = 1
        
        imagePicker.dismiss(animated: true, completion: nil)
    }
 
    @IBAction func cameraTapped(_ sender: Any) {
      
    }
    
    @IBAction func addTapped(_ sender: Any) {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        let record = Record(context: context)
        record.title = titleTextField.text
        record.image = UIImagePNGRepresentation(recordImageView.image!) as NSData?
        
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
        
        navigationController!.popViewController(animated: true)
        
    }

}
