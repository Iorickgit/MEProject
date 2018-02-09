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
    var image: UIImage!
    
    init(name: String, image: UIImage, course: String){
        self.name = name
        self.image = image
        self.course = course
    }
}
