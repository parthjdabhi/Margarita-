//
//  InfoViewController.swift
//  Margarita!
//
//  Created by Карпенко Михайло on 26.05.16.
//  Copyright © 2016 Карпенко Михайло. All rights reserved.
//

import UIKit

class InfoViewController: UIViewController, UIPageViewControllerDataSource, UIPageViewControllerDelegate {

	@IBOutlet var restartButton: UIButton!
	@IBOutlet var skipButton: UIButton!
	
	
	var pageViewController: UIPageViewController!
	var pageTitles: NSArray!
	var pageSubTitles: NSArray!
	var pageImages: NSArray!
	
	var currentIndex: Int? = 0
	
	let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
	
	
	override func viewDidLoad()
	{
		super.viewDidLoad()
		
		self.navigationController?.setNavigationBarHidden(true, animated: true)
		
		self.pageTitles = NSArray(objects: "Title 1", "Title 2", "Title 3", "Title 4", "Title 5", "Title 6", "Title 7", "Title 8", "Title 9", "Title 10", "Title 11", "Title 12")
		self.pageSubTitles = NSArray(objects: "Subtitle 1", "Subtitle 2", "Subtitle 3", "Subtitle 4", "Subtitle 5", "Subtitle 6", "Subtitle 7", "Subtitle 8", "Subtitle 9", "Subtitle 10", "Subtitle 11", "Subtitle 12")
		self.pageImages = NSArray(objects: "background1.png", "background2.png", "background3.png", "background4.png", "background5.png", "background6.png", "background7.png", "background8.png", "background9.png", "background10.png", "background11.png", "background12.png")
		
		self.pageViewController = self.storyboard?.instantiateViewControllerWithIdentifier("PageViewController") as!
		UIPageViewController
		self.pageViewController.dataSource = self
		self.pageViewController.delegate = self
		
		let startVC = self.viewControllerAtIndex(0) as ContentViewController
		let viewControllers = NSArray(object: startVC)
		
		self.pageViewController.setViewControllers((viewControllers as! [UIViewController]), direction: .Forward, animated: true, completion: nil)
		
		self.pageViewController.view.frame = CGRectMake(0, 30, self.view.frame.width, self.view.frame.size.height - 80)
		
		self.addChildViewController(self.pageViewController)
		self.view.addSubview(self.pageViewController.view)
		self.pageViewController.didMoveToParentViewController(self)
		
		
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
	
	override func viewWillAppear(animated: Bool) {
		self.navigationController?.setNavigationBarHidden(true, animated: animated)
		
	}
	
	override func viewWillDisappear(animated: Bool) {
		self.navigationController?.setNavigationBarHidden(false, animated: animated)
		
	}
	
	override func preferredStatusBarStyle() -> UIStatusBarStyle {
		return UIStatusBarStyle.LightContent
	}
	
	@IBAction func restartAction(sender: AnyObject)
	{
		if(self.currentIndex == 0) {
			
		} else {
			let startVC = self.viewControllerAtIndex(0) as ContentViewController
			let viewControllers = NSArray(object: startVC)
			
			self.pageViewController.setViewControllers((viewControllers as! [UIViewController]), direction: .Forward, animated: true, completion: nil)
			currentIndex = 0
			self.restartButton.enabled = false
			self.restartButton.hidden = true
			self.skipButton.setTitle("Skip", forState: .Normal)
		}
	}
	
	
	func viewControllerAtIndex(index: Int) -> ContentViewController
	{
		if ((self.pageTitles.count == 0) || (index >= self.pageTitles.count)) {
			return ContentViewController()
		}
		
		let vc: ContentViewController = self.storyboard?.instantiateViewControllerWithIdentifier("ContentViewController") as! ContentViewController
		
		vc.imageFile = self.pageImages[index]as! String
		vc.titleText = self.pageTitles[index] as! String
		vc.subTitleText = self.pageSubTitles[index] as! String
		
		vc.pageIndex = index
		
		return vc
		
	}
	
	// MARK: - Page View Controller Data Source
	
	func pageViewController(pageViewController: UIPageViewController, viewControllerBeforeViewController viewController: UIViewController) -> UIViewController?
	{
		
		let vc = viewController as! ContentViewController
		var index = vc.pageIndex as Int
		
		
		if (index == 0 || index == NSNotFound)
		{
			return nil
			
		}
		
		index -= 1
		return self.viewControllerAtIndex(index)
		
	}
	
	func pageViewController(pageViewController: UIPageViewController, viewControllerAfterViewController viewController: UIViewController) -> UIViewController? {
		
		let vc = viewController as! ContentViewController
		var index = vc.pageIndex as Int
		
		if (index == NSNotFound)
		{
			return nil
		}
		
		index += 1
		
		if (index == self.pageTitles.count)
		{
			return nil
		}
		
		return self.viewControllerAtIndex(index)
		
	}
	
	func presentationCountForPageViewController(pageViewController: UIPageViewController) -> Int
	{
		return self.pageTitles.count
	}
	
	func presentationIndexForPageViewController(pageViewController: UIPageViewController) -> Int
	{
		return 0
	}
	
	func pageViewController(pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool){
		let pageContentViewController = pageViewController.viewControllers![0] as! ContentViewController
		self.currentIndex = pageContentViewController.pageIndex
		
		switch (pageContentViewController.pageIndex) {
		case 0:
			self.restartButton.enabled = false
			self.restartButton.hidden = true
			self.skipButton.setTitle("Skip", forState: .Normal)
		case 1...10:
			self.restartButton.alpha = 1.0
			self.skipButton.alpha = 1.0
			self.restartButton.enabled = true
			self.restartButton.hidden = false
			self.skipButton.setTitle("Skip", forState: .Normal)
		case 11:
			self.restartButton.alpha = 1.0
			self.skipButton.alpha = 1.0
			self.restartButton.enabled = true
			self.restartButton.hidden = false
//			if (self.appDelegate.isAppAlreadyLaunchedOnce != true) {
//				self.skipButton.setTitle("Go!", forState: .Normal)
//			} else {
//				self.skipButton.setTitle("Menu", forState: .Normal)
//			}
		default:
			self.restartButton.alpha = 1.0
			UIView.animateWithDuration(1.0, delay: 0.1, options: .CurveEaseOut, animations: {
				self.restartButton.alpha = 0.0
				self.restartButton.enabled = false
				self.restartButton.hidden = true
				self.skipButton.setTitle("Skip", forState: .Normal)
				}, completion: {_ in
					// Comletion
			})
		}
	}
	
	@IBAction func goBackButtonPressed(sender: AnyObject) {
		self.navigationController?.popToRootViewControllerAnimated(true)
	}
	
}
