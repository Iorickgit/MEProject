//
//  MentorList.swift
//  MentorsEncyclopedia
//
//  Created by 南伊織 on 2018/02/10.
//  Copyright © 2018年 南伊織. All rights reserved.
//

import UIKit

class mentorList{
    var name: String!
    var course: String!
    var imageName: String!
    
    init(name: String, imageName: String, course: String){
        self.name = name
        self.imageName = imageName
        self.course = course
    }
    
    func getImage() -> UIImage{
        return UIImage(named: imageName)!
    }
}
