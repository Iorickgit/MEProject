//
//  MentorList.swift
//  MentorsEncyclopedia
//
//  Created by 南伊織 on 2018/02/10.
//  Copyright © 2018年 南伊織. All rights reserved.
//

import UIKit

class mentorList: NSObject, NSCoding{
    var name: String!
    var course: String!
    var image: UIImage!
    
    //initialize class
    init(name: String, image: UIImage, course: String){
        self.name = name
        self.image = image
        self.course = course
    }
    
    //decoder initializing
    required init(coder decoder: NSCoder) {
        self.name = decoder.decodeObject(forKey: "name") as? String ?? ""
        self.course = decoder.decodeObject(forKey: "course") as? String ?? ""
        self.image = decoder.decodeObject(forKey: "image") as! UIImage
    }
    
    //coder initializing
    func encode(with coder: NSCoder) {
        coder.encode(name, forKey: "name")
        coder.encode(course, forKey: "course")
        coder.encode(image, forKey: "image")
    }
}

class savedData{
    var userDefaults: UserDefaults = UserDefaults.standard
}

class archiver{
    func archiveData(file: Any) -> Any{
        let archivedArray = NSKeyedArchiver.archivedData(withRootObject: file)
        return archivedArray
    }
    
    func unArchiveData(file: Data) -> Any{
        let unArchivedArray = NSKeyedUnarchiver.unarchiveObject(with: file)
        return unArchivedArray!
    }
}
