//
//  TableViewCardCell.swift
//  Binocular
//
//  Created by Caleb Thomas on 2/16/19.
//  Copyright © 2019 Caleb Thomas. All rights reserved.
//

import Foundation
import UIKit

import MaterialComponents.MaterialCards

class StoryTableViewCell: UITableViewCell {
  
  var categoryLabel: UILabel!
  var headlineLabel: UILabel!
  var storyImageView: UIImageView!
  
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    
    // Make card
    let card = MDCCard()
    
    self.addSubview(card)
    card.snp.makeConstraints { (make) in
      make.top.equalToSuperview().offset(20)
      make.left.equalToSuperview()
      make.bottom.equalToSuperview().offset(-20)
      make.right.equalToSuperview()
    }
    
    // image
    storyImageView = UIImageView()
    storyImageView.frame = CGRect(x: 0, y: 0, width: 69, height: 69)
    storyImageView.layer.cornerRadius = 6.0
    storyImageView.contentMode = .scaleAspectFill
    storyImageView.clipsToBounds = true
    
    // category label
    categoryLabel = UILabel()
    categoryLabel.frame = CGRect(x: 0, y: 0, width: 50, height: 40)
    categoryLabel.font = UIFont.systemFont(ofSize: 16.0)
    categoryLabel.textColor = UIColor(red: 169, green: 171, blue: 181, alpha: 1.0)
    categoryLabel.backgroundColor = UIColor.clear
    
    // headline label
    headlineLabel = UILabel()
    headlineLabel.frame = CGRect(x: 0, y: 0, width: 50, height: 60)
    headlineLabel.font = UIFont.systemFont(ofSize: 18.0)
    headlineLabel.textColor = UIColor(red: 4, green: 5, blue: 10, alpha: 1.0)
    headlineLabel.lineBreakMode = .byWordWrapping
    headlineLabel.numberOfLines = 3
    headlineLabel.backgroundColor = UIColor.clear
    
    card.addSubview(categoryLabel)
    card.addSubview(headlineLabel)
    card.addSubview(storyImageView)
    
    storyImageView.snp.makeConstraints({ make in
      make.top.equalTo(card.snp.top).offset(10)
      make.bottom.equalTo(card.snp.bottom).offset(-10)
      make.right.equalTo(card.snp.right).offset(-5)
      make.width.equalTo(storyImageView.snp.height)
    })
    
    categoryLabel.snp.makeConstraints({make in
      make.left.equalTo(card.snp.left) //.offset(-5)
      make.right.equalTo(card.snp.left).offset(-5)
      make.top.equalTo(card.snp.top) //.offset(-10)
    })
    
    headlineLabel.snp.makeConstraints({make in
      make.left.equalTo(categoryLabel.snp.left)
      make.right.equalTo(storyImageView.snp.left).offset(-5)
      make.top.equalTo(categoryLabel.snp.bottom).offset(-5)
    })
    
  }
  
  required init(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override func awakeFromNib() {
    super.awakeFromNib()
  }
}
