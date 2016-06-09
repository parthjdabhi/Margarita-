//
//  PortraitMenuItemView.swift
//  Margarita!
//
//  Created by Карпенко Михайло on 26.05.16.
//  Copyright © 2016 Карпенко Михайло. All rights reserved.
//

import UIKit

@IBDesignable class PortraitMenuItemView: UIView {

	var view: UIView!
	var nibName = "PortraitMenuItemView"
	
	@IBOutlet weak var mainImage: UIImageView!
	@IBOutlet weak var mainLabel: UILabel!
	@IBOutlet weak var subLabel: UILabel!
	@IBOutlet weak var goIcon: UIImageView!
	
	
	@IBInspectable var mainIconImage: UIImage? {
		get {
			return mainImage.image
		}
		set(image) {
			mainImage.image = image
		}
	}
	
	@IBInspectable var mainTitleText: String? {
		get {
			return mainLabel.text
		}
		set(text) {
			mainLabel.text = text
		}
	}
	
	@IBInspectable var subTitleText: String? {
		get {
			return subLabel.text
		}
		set(text) {
			subLabel.text = text
		}
	}
	
	@IBInspectable var goIconImage: UIImage? {
		get {
			return goIcon.image
		}
		set(image) {
			goIcon.image = image
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
	
	func setValues(mainIconName: String, mainTitleText: String,subTitleText: String, goIconName: String) {
		self.mainImage.image = UIImage.init(named: mainIconName)
		self.mainLabel.text = mainTitleText
		self.subLabel.text = subTitleText
		self.goIcon.image = UIImage.init(named: goIconName)
	}

}
