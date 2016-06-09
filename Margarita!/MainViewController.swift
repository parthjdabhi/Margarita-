//
//  ViewController.swift
//  Margarita!
//
//  Created by Карпенко Михайло on 26.05.16.
//  Copyright © 2016 Карпенко Михайло. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

	
	@IBOutlet var oldBackground: UIImageView!
	@IBOutlet var newBackground: UIImageView!
	
	
	@IBAction func favoriteButton(sender: AnyObject) {
		self.navigationController?.pushViewController((storyboard?.instantiateViewControllerWithIdentifier("FavoritesTV"))!, animated: true)
	}
	@IBAction func infoButton(sender: AnyObject) {
		self.navigationController?.pushViewController((storyboard?.instantiateViewControllerWithIdentifier("InfoVC"))!, animated: true)
	}
	
	@IBAction func feedbackButton(sender: AnyObject) {
		self.navigationController?.pushViewController((storyboard?.instantiateViewControllerWithIdentifier("FeedbackVC"))!, animated: true)
	}
	@IBAction func ratingsButton(sender: AnyObject) {
		self.navigationController?.pushViewController((storyboard?.instantiateViewControllerWithIdentifier("RatingsTV"))!, animated: true)
	}
	
	
	@IBOutlet weak var menuItem1: UIView!
	
	@IBOutlet weak var menuItem2: UIView!
	
	@IBOutlet weak var menuItem3: UIView!
	
	@IBOutlet weak var menuItem4: UIView!
	
	@IBOutlet weak var menuItem5: UIView!
	
	@IBOutlet weak var menuItem6: UIView!
	
	@IBOutlet weak var menuItem7: UIView!
	
	@IBOutlet weak var menuItem8: UIView!
	
	
	let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
	
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		self.navigationController?.setNavigationBarHidden(true, animated: true)
		
		if (appDelegate.isAppAlreadyLaunchedOnce != true) {
			self.navigationController?.pushViewController((storyboard?.instantiateViewControllerWithIdentifier("InfoVC"))!, animated: true)
		} else {
			oldBackground.image = UIImage.init(named: "1")
			newBackground.image = UIImage.init(named: "1")
		}
	}

	override func viewWillAppear(animated: Bool) {
		self.navigationController?.setNavigationBarHidden(true, animated: false)
		
		oldBackground.image = UIImage.init(named: "1")
		newBackground.image = UIImage.init(named: "1")
		
		newBackground.image = newBackground.image?.applyBlurWithRadius(10, tintColor: UIColor(white: 0.11, alpha: 0.73), saturationDeltaFactor: 1.8)
		
		
		viewAppearAnimation(menuItem1, duration: 0.5, delay: 0.2, flag: true)
		viewAppearAnimation(menuItem2, duration: 0.5, delay: 0.3, flag: true)
		viewAppearAnimation(menuItem3, duration: 0.5, delay: 0.4, flag: true)
		viewAppearAnimation(menuItem4, duration: 0.5, delay: 0.5, flag: true)
		viewAppearAnimation(menuItem5, duration: 0.5, delay: 0.6, flag: true)
		viewAppearAnimation(menuItem6, duration: 0.5, delay: 0.7, flag: true)
		viewAppearAnimation(menuItem7, duration: 0.5, delay: 0.8, flag: true)
		viewAppearAnimation(menuItem8, duration: 0.5, delay: 0.9, flag: true)
		
		imageFadeInAnimation(oldBackground, secondImageView: newBackground)
	}
	
	func imageFadeInAnimation(firstImageView: UIImageView,secondImageView: UIImageView) {
		secondImageView.alpha = 0.0
		UIView.animateWithDuration(2.5, delay: 0.2, options: .CurveEaseOut, animations: {
			secondImageView.alpha = 1.0
			}, completion: {_ in
				firstImageView.image = secondImageView.image
				//secondImageView.removeFromSuperview()
		})
	}
	
	override func viewWillDisappear(animated: Bool) {
		self.navigationController?.setNavigationBarHidden(false, animated: false)
		
		viewAppearAnimation(menuItem1, duration: 0.5, delay: 0.2, flag: false)
		viewAppearAnimation(menuItem2, duration: 0.5, delay: 0.3, flag: false)
		viewAppearAnimation(menuItem3, duration: 0.5, delay: 0.4, flag: false)
		viewAppearAnimation(menuItem4, duration: 0.5, delay: 0.5, flag: false)
		viewAppearAnimation(menuItem5, duration: 0.5, delay: 0.6, flag: false)
		viewAppearAnimation(menuItem6, duration: 0.5, delay: 0.7, flag: false)
		viewAppearAnimation(menuItem7, duration: 0.5, delay: 0.8, flag: false)
		viewAppearAnimation(menuItem8, duration: 0.5, delay: 0.9, flag: false)
	}
	
	
	
	func viewAppearAnimation(view: UIView, duration:NSTimeInterval, delay: NSTimeInterval, flag:Bool) {
		view.alpha = 0.0
		UIView.animateWithDuration(duration, delay: delay, options: .CurveEaseOut, animations: {
			view.alpha = 1.0
			if flag{
				view.center.y -= self.view.bounds.height
			}else{
				view.center.y += self.view.bounds.height
			}
			}, completion: {_ in
				// Comletion
		})
	}
}

