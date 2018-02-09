//
//  ViewController.swift
//  MentorsEncyclopedia
//
//  Created by 南伊織 on 2018/02/10.
//  Copyright © 2018年 南伊織. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate{

    @IBOutlet var pickedPhoto: UIImageView!
    @IBOutlet var mentorNameText: UITextField!
    @IBOutlet var courseNameText: UITextField!
    
    var mentorArray: [mentorList] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //mentorArray.append("")
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func choosePicture() {
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
            let pickerView = UIImagePickerController()
            pickerView.sourceType = .photoLibrary
            pickerView.delegate = self
            self.present(pickerView, animated: true)
        }
    }
    
    @IBAction func addNewMentor(){
        mentorArray.append(mentorList(name: mentorNameText.text!, image: pickedPhoto.image!, course: courseNameText.text!))
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        let image = info[UIImagePickerControllerOriginalImage] as! UIImage
        print(image)
        self.pickedPhoto.image = image
        self.dismiss(animated:true, completion: nil)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }


}

