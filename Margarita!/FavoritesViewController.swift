//
//  FavoritesViewController.swift
//  Margarita!
//
//  Created by Карпенко Михайло on 26.05.16.
//  Copyright © 2016 Карпенко Михайло. All rights reserved.
//

import UIKit

class FavoritesViewController: UITableViewController {
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		self.navigationController?.setNavigationBarHidden(false, animated: true)
		
		let nib = UINib(nibName: "FavoritesViewCell", bundle: nil)
		tableView.registerNib(nib, forCellReuseIdentifier: "FavoritesCell")
		
	}
	
	override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return FavoritesModel.FavoriteModel.itemsArray.count
	}
	
	override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell 	{
		
		let cell:FavoritesTableViewCell = self.tableView.dequeueReusableCellWithIdentifier("FavoritesCell") as! FavoritesTableViewCell
		
		cell.background.image = UIImage(named: FavoritesModel.FavoriteModel.itemsArray[indexPath.row].backgroundImageName)
		cell.title.text = FavoritesModel.FavoriteModel.itemsArray[indexPath.row].titleText
		cell.subtitle.text = FavoritesModel.FavoriteModel.itemsArray[indexPath.row].subTitleText
		
		return cell
	}
	
	override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
		print("Row \(indexPath.row) selected")
	}
	
	override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
		return 150
	}
}
