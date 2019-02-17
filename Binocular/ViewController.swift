//
//  ViewController.swift
//  Binocular
//
//  Created by Caleb Thomas on 2/16/19.
//  Copyright © 2019 Caleb Thomas. All rights reserved.
//

import UIKit

import MaterialComponents.MaterialCards
import SnapKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

  // MARK: Properties
  @IBOutlet weak var dateLabel: UILabel!
  @IBOutlet weak var headlineCard: MDCCard!
  @IBOutlet weak var cardTable: UITableView!
  
  var stories = [Story]()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    cardTable.register(StoryTableViewCell.self, forCellReuseIdentifier: "StoryTableViewCell")
    
    // set the date as today
    setDate()
    
    // setup table delegate
    cardTable.delegate = self
    cardTable.dataSource = self
    cardTable.backgroundColor = UIColor(red: 233, green: 234, blue: 236, alpha: 1.0)
    cardTable.backgroundView?.backgroundColor = UIColor(red: 233, green: 234, blue: 236, alpha: 1.0)
    
    self.navigationController?.view.backgroundColor = UIColor(red: 233, green: 234, blue: 236, alpha: 1.0)
    
    // get headline and build card
    let categoryText = "U.S."
    let categoryLabel = UILabel()
    categoryLabel.font = UIFont.systemFont(ofSize: 16.0)
    categoryLabel.text = String(categoryText)
    categoryLabel.textColor = UIColor(red: 223, green: 234, blue: 236, alpha: 1.0)
    
    let headlineText = "Trump Declares National Emergency for Border Wall"
    let headlineLabel = UILabel()
    headlineLabel.font = UIFont.boldSystemFont(ofSize: 24.0)
    headlineLabel.text = String(headlineText)
    headlineLabel.textColor = UIColor(red: 223, green: 234, blue: 236, alpha: 1.0)
    headlineLabel.lineBreakMode = .byWordWrapping
    headlineLabel.numberOfLines = 2
    
    let imageView = UIImageView()
    let image = UIImage(named: "trump")
    imageView.image = image
    imageView.contentMode = .scaleAspectFill
    
    let view = UIView(frame: headlineCard.frame)
    let gradient = CAGradientLayer()
    gradient.frame = headlineCard.layer.bounds
    gradient.colors = [UIColor.clear.cgColor, UIColor.black.cgColor]
    gradient.locations = [0.0, 1.0]
    view.layer.insertSublayer(gradient, at: 0)

    headlineCard.addSubview(imageView)
    headlineCard.addSubview(view)
    headlineCard.bringSubviewToFront(view)
    headlineCard.clipsToBounds = true

    view.snp.makeConstraints { (make) in
      make.top.equalToSuperview()
      make.top.equalToSuperview()
      make.left.equalToSuperview()
      make.bottom.equalToSuperview()
    }
    
    imageView.snp.makeConstraints { (make) in
      make.top.equalTo(headlineCard.snp_topMargin).offset(-20)
      make.left.equalTo(headlineCard.snp_leftMargin).offset(-20)
      make.bottom.equalTo(headlineCard.snp_bottomMargin).offset(20)
      make.right.equalTo(headlineCard.snp_rightMargin).offset(20)
    }
    
    headlineCard.addSubview(categoryLabel)
    headlineCard.addSubview(headlineLabel)
    
    categoryLabel.snp.makeConstraints { (make) in
      make.left.equalTo(headlineCard.snp_leftMargin).offset(10)
      make.bottom.equalTo(headlineLabel.snp_topMargin).offset(-10)
    }
    
    headlineLabel.snp.makeConstraints { (make) in
      make.left.equalTo(headlineCard.snp_leftMargin).offset(10)
      make.right.equalTo(headlineCard.snp_rightMargin).offset(-10)
      make.bottom.equalTo(headlineCard.snp_bottomMargin).offset(-5)
    }
    
    headlineCard.setNeedsDisplay()
    
    // get other news
    loadSampleStories()
    
    cardTable.setNeedsDisplay()
  }
  
  
  //MARK: Private Methods
  private func loadSampleStories() {
    let photo1 = UIImage(named: "ocasio")
    let photo2 = UIImage(named: "collin")
    let photo3 = UIImage(named: "gavin")
    let photo4 = UIImage(named: "police")
    
    let story1 = Story(category: "U.S.", title: "Ocasio-Cortez faces heat for Amazon canceling NYC plan", image: photo1!, text: "blah blah")
    let story2 = Story(category: "Sports", title: "Colin Kaepernick and NFL settle collusion case", image: photo2!, text: "blah blah blah 2")
    let story3 = Story(category: "U.S.", title: "California governor accusses Trump of keeping disaster money from wildfire survivors", image: photo3!, text: "Hey there")
    let story4 = Story(category: "U.S.", title: "Gunman in Illinois warehouse kills 5 people", image: photo4!, text: "gun control or something")
    
    stories += [story1, story2, story3, story4]
  }
  
  func setDate() {
    let dateFormatter = DateFormatter()
    dateFormatter.dateStyle = .medium
    dateFormatter.timeStyle = .none
    
    // US English Locale (en_US)
    dateFormatter.locale = Locale(identifier: "en_US")
    let dateString = dateFormatter.string(from: Date())
    
    dateLabel.text = String(dateString)
  }

  // MARK: - Table view data source
  func numberOfSections(in tableView: UITableView) -> Int {
    return 1
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return stories.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cellIdentifier = "StoryTableViewCell"
    guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? StoryTableViewCell else {
      fatalError("The dequeued cell is not an instance of StoryTableViewCell.")
    }
    let story = stories[indexPath.row]
    
    // Configure the cell...
    cell.categoryLabel.text = String(story.category)
    cell.headlineLabel.text = String(story.title)
    cell.storyImageView.image = story.image
    
    cell.backgroundColor = UIColor.clear
    cell.contentView.backgroundColor = UIColor.clear
    cell.textLabel?.backgroundColor = UIColor.clear
    
    tableView.backgroundView = nil
    tableView.backgroundColor = UIColor(red: 223, green: 234, blue: 236, alpha: 1.0)
    
    return cell
  }
  
  func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
    cell.backgroundColor = UIColor.clear
    tableView.backgroundView = nil
    tableView.backgroundColor = UIColor(red: 223, green: 234, blue: 236, alpha: 1.0)
  }

}
