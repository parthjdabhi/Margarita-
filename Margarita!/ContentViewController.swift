//
//  CotentViewController.swift
//  Margarita!
//
//  Created by Карпенко Михайло on 26.05.16.
//  Copyright © 2016 Карпенко Михайло. All rights reserved.
//

import UIKit

class ContentViewController: UIViewController {
	
	@IBOutlet weak var imageView: UIImageView!
	@IBOutlet weak var titleLabel: UILabel!
	@IBOutlet var subTitleLabel: UILabel!
	
	var pageIndex: Int!
	var titleText: String!
	var subTitleText: String!
	var imageFile: String!
	
	
	
	override func viewDidLoad()
	{
		super.viewDidLoad()
		
		self.navigationController?.setNavigationBarHidden(true, animated: true)
		
		self.imageView.image = UIImage(named: self.imageFile)
		self.titleLabel.text = self.titleText
		self.subTitleLabel.text = self.subTitleText
		
	}
	
	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}
	
	/*
	// MARK: - Navigation
	
	// In a storyboard-based application, you will often want to do a little preparation before navigation
	override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
	// Get the new view controller using segue.destinationViewController.
	// Pass the selected object to the new view controller.
	}
	*/
	
}
