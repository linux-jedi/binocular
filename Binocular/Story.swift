//
//  Story.swift
//  Binocular
//
//  Created by Caleb Thomas on 2/17/19.
//  Copyright © 2019 Caleb Thomas. All rights reserved.
//

import UIKit

class Story {
  
  //MARK: Properties
  
  var category: String
  var title: String
  var image: UIImage
  var text: String
  
  
  init(category: String, title: String, image: UIImage, text: String ) {
    self.category = category
    self.title = title
    self.image = image
    self.text = text
  }
}
