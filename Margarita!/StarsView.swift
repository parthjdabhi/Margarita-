//
//  StarsView.swift
//  Margarita!
//
//  Created by Карпенко Михайло on 27.05.16.
//  Copyright © 2016 Карпенко Михайло. All rights reserved.
//

import UIKit

@IBDesignable class StarsView: UIView {
	
	var view: UIView!
	var nibName = "StarsView"
	
	var starsState: UInt! //0-5
	
	var filledStar: UIImage!
	var emptyStar: UIImage!
	
	func setValues(starsState: UInt, filledStarImageName: String,emptyStarImageName: String) {
		self.starsState = starsState
		self.filledStar = UIImage(named: filledStarImageName)
		self.emptyStar = UIImage(named: emptyStarImageName)
	}
	
	
	//Outlets
	@IBOutlet weak var star1: UIButton!
	@IBOutlet weak var star2: UIButton!
	@IBOutlet weak var star3: UIButton!
	@IBOutlet weak var star4: UIButton!
	@IBOutlet weak var star5: UIButton!
	
	
	@IBInspectable var starsStateUInt: UInt? {
		get {
			return starsState
		}
		set(state) {
			starsState = state
			switch(starsState) {
			case 0:
				star1.setImage(emptyStar, forState: .Normal)
				star2.setImage(emptyStar, forState: .Normal)
				star3.setImage(emptyStar, forState: .Normal)
				star4.setImage(emptyStar, forState: .Normal)
				star5.setImage(emptyStar, forState: .Normal)
			case 1:
				star1.setImage(filledStar, forState: .Normal)
				star2.setImage(emptyStar, forState: .Normal)
				star3.setImage(emptyStar, forState: .Normal)
				star4.setImage(emptyStar, forState: .Normal)
				star5.setImage(emptyStar, forState: .Normal)
			case 2:
				star1.setImage(filledStar, forState: .Normal)
				star2.setImage(filledStar, forState: .Normal)
				star3.setImage(emptyStar, forState: .Normal)
				star4.setImage(emptyStar, forState: .Normal)
				star5.setImage(emptyStar, forState: .Normal)
			case 3:
				star1.setImage(filledStar, forState: .Normal)
				star2.setImage(filledStar, forState: .Normal)
				star3.setImage(filledStar, forState: .Normal)
				star4.setImage(emptyStar, forState: .Normal)
				star5.setImage(emptyStar, forState: .Normal)
			case 4:
				star1.setImage(filledStar, forState: .Normal)
				star2.setImage(filledStar, forState: .Normal)
				star3.setImage(filledStar, forState: .Normal)
				star4.setImage(filledStar, forState: .Normal)
				star5.setImage(emptyStar, forState: .Normal)
			case 5:
				star1.setImage(filledStar, forState: .Normal)
				star2.setImage(filledStar, forState: .Normal)
				star3.setImage(filledStar, forState: .Normal)
				star4.setImage(filledStar, forState: .Normal)
				star5.setImage(filledStar, forState: .Normal)
			default:
				star1.setImage(emptyStar, forState: .Normal)
				star2.setImage(emptyStar, forState: .Normal)
				star3.setImage(emptyStar, forState: .Normal)
				star4.setImage(emptyStar, forState: .Normal)
				star5.setImage(emptyStar, forState: .Normal)
				print("Error - can't be 6+ stars")
			}
		}
	}
	
	
	@IBInspectable var filledStarImage: UIImage! {
		get {
			return filledStar
		}
		set(image) {
			filledStar = image
		}
	}
	
	@IBInspectable var emptyStarImage: UIImage! {
		get {
			return emptyStar
		}
		set(image) {
			emptyStar = image
		}
	}
	
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		xibSetup()
	}
	
	required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
		xibSetup()
	}
	
	func xibSetup() {
		view = loadViewFromNib()
		view.frame = bounds
		view.autoresizingMask = [UIViewAutoresizing.FlexibleWidth, UIViewAutoresizing.FlexibleHeight]
		addSubview(view)
	}
	
	func loadViewFromNib() -> UIView {
		let bundle = NSBundle(forClass: self.dynamicType)
		let nib = UINib(nibName: nibName, bundle: bundle)
		let view = nib.instantiateWithOwner(self, options: nil)[0] as! UIView
		return view
	}
	
	
	@IBAction func star1ButtonPressed(sender: AnyObject) {
		starsStateUInt = 1;
		//print("1")
	}
	
	@IBAction func star2ButtonPressed(sender: AnyObject) {
		starsStateUInt = 2;
		//print("2")
	}
	
	@IBAction func star3ButtonPressed(sender: AnyObject) {
		starsStateUInt = 3;
		//print("3")
	}
	
	@IBAction func star4ButtonPressed(sender: AnyObject) {
		starsStateUInt = 4;
		//print("4")
	}
	
	@IBAction func star5ButtonPressed(sender: AnyObject) {
		starsStateUInt = 5;
		//print("5")
	}
	
	
	
	/*
	// Only override drawRect: if you perform custom drawing.
	// An empty implementation adversely affects performance during animation.
	override func drawRect(rect: CGRect) {
	// Drawing code
	}
	*/
	
}

