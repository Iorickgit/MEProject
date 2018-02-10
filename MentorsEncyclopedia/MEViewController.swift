//
//  MEViewController.swift
//  MentorsEncyclopedia
//
//  Created by 南伊織 on 2018/02/10.
//  Copyright © 2018年 南伊織. All rights reserved.
//

import UIKit

class MEViewController: UIViewController{
    
    var mentorArray: [mentorList] = []
    var initialImageArray: [UIImage] = []
    var addImageArray: [UIImage] = []
    var finalImageArray: [UIImage] = []
    var archiver = dataArchiver()
    var saveData = savedData()
    
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var courseLabel: UILabel!
    
    var index: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialImageArray.append(UIImage(named: "John.jpg")!)
        initialImageArray.append(UIImage(named: "Noel.jpg")!)
        mentorArray.append(mentorList(name: "John", /*image: initialImageArray[0],*/ course: "RHCP"))
        mentorArray.append(mentorList(name: "Noel", /*image: initialImageArray[1],*/ course: "Oasis"))
        print(initialImageArray)
        saveData.userDefaults.set(archiver.archiveData(file: initialImageArray), forKey: "savedImage")
        print((archiver.unArchiveData(file: saveData.userDefaults.data(forKey: "savedImage")!)))
        //saveData.userDefaults.register(defaults: ["savedImage": archiver.archiveData(file: initialImageArray)])
        saveData.userDefaults.register(defaults: ["savedList": archiver.archiveData(file: mentorArray)])
        print("archived")
        // Do any additional setup after loading the view.
        mentorArray = archiver.unArchiveData(file: saveData.userDefaults.data(forKey: "savedList")!) as! [mentorList]
        finalImageArray = (archiver.unArchiveData(file: saveData.userDefaults.data(forKey: "savedImage")!) as! [UIImage])
        print(finalImageArray)
        print(mentorArray)
        setUI()
    }
    
    @IBAction func next(){
        index = index + 1
        setUI()
    }

    @IBAction func back(){
        index = index - 1
        setUI()
    }
    
    func setUI(){
        imageView.image = finalImageArray[index]
        nameLabel.text = mentorArray[index].name
        courseLabel.text = mentorArray[index].course
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
