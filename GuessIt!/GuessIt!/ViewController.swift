//
//  ViewController.swift
//  GuessIt!
//
//  Created by Soul & Co on 8/5/17.
//  Copyright © 2017 DanielaLetunica. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
    //User Image
    @IBOutlet weak var Insert: UIImageView!
    
    
    //Insert User image
    @IBAction func InsertImageButton(_ sender: AnyObject) {
        
        let image = UIImagePickerController()
        image.delegate = self
        image.sourceType = UIImagePickerControllerSourceType.photoLibrary
        image.allowsEditing = true
        self.present(image, animated: true)

    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any])
    {
        
        if let image =  info[UIImagePickerControllerOriginalImage] as? UIImage
        {
            Insert.image = image
            
        }
        else
        {
            Insert.image = nil
        }
        self.dismiss(animated: true, completion: nil)
    }

    
    @IBOutlet weak var scoreLable: UILabel!
    
    if score
    //Start Button
    
    @IBAction func StartButton(_ sender: AnyObject) {
        
        SecondViewController()
    }
    
    
    
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

