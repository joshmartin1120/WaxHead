//
//  RecordViewController.swift
//  WaxHead
//
//  Created by Joshua Martin on 6/16/17.
//  Copyright © 2017 Joshua Martin. All rights reserved.
//

import UIKit

class RecordViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        imagePicker.delegate = self
        
    }
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var recordImageView: UIImageView!
    
    
    var imagePicker = UIImagePickerController()
    
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
   


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
