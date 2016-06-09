//
//  RatingsTableViewController.swift
//  Margarita!
//
//  Created by Карпенко Михайло on 27.05.16.
//  Copyright © 2016 Карпенко Михайло. All rights reserved.
//

import UIKit

class RatingsTableViewController: UITableViewController {
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		self.navigationController?.setNavigationBarHidden(false, animated: true)
		
		let nib = UINib(nibName: "RatingsTableViewController", bundle: nil)
		tableView.registerNib(nib, forCellReuseIdentifier: "RatedCell")
		
	}
	
	override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return RatedModel.TopRatedModel.itemsArray.count
	}
	
	override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell 	{
		
		let cell:RatingsTableViewCell = self.tableView.dequeueReusableCellWithIdentifier("RatedCell") as! RatingsTableViewCell
		
		cell.background.image = UIImage(named: RatedModel.TopRatedModel.itemsArray[indexPath.row].backgroundImageName)
		cell.title.text = RatedModel.TopRatedModel.itemsArray[indexPath.row].titleText
		cell.rating.text = RatedModel.TopRatedModel.itemsArray[indexPath.row].ratingText
		//cell.starsView.starsStateUInt = TopRatedModel.sharedModel.itemsArray[indexPath.row].starsState
		
		return cell
	}
	
	override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
		print("Row \(indexPath.row) selected")
	}
	
	override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
		return 150
	}

	
}
