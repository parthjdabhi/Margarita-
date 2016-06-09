//
//  FeedbackViewController.swift
//  Margarita!
//
//  Created by Карпенко Михайло on 26.05.16.
//  Copyright © 2016 Карпенко Михайло. All rights reserved.
//

import UIKit

extension String {
	func isValidEmail() -> Bool {
		// println("validate calendar: \(testStr)")
		let emailRegEx = "^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$"
		let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
		return emailTest.evaluateWithObject(self)
	}
}

class Message: NSObject {
	var username: String!
	var email: String!
	var message: String!
	
	init(username: String, email: String, message: String){
		self.username = username
		self.email = email
		self.message = message
	}
	
	required init(coder aDecoder: NSCoder) {
		self.username = aDecoder.decodeObjectForKey("username") as! String
		self.email = aDecoder.decodeObjectForKey("email") as! String
		self.message = aDecoder.decodeObjectForKey("message") as! String
	}
	
	func encodeWithCoder(aCoder: NSCoder!) {
		aCoder.encodeObject(username, forKey: "username")
		aCoder.encodeObject(email, forKey: "email")
		aCoder.encodeObject(email, forKey: "message")
	}
}

class FeedbackViewController: UIViewController, UITextFieldDelegate {
	
	@IBOutlet weak var scrollView: UIScrollView!
	@IBOutlet weak var username: UITextField!
	@IBOutlet weak var email: UITextField!
	@IBOutlet weak var message: UITextView!
	
	@IBOutlet var sendButton: UIButton!
	
	var frameView: UIView!
	
	let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		// Do any additional setup after loading the view.
		
		self.frameView = UIView(frame: CGRectMake(0, 0, self.view.bounds.width, self.view.bounds.height))
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
	
	override func preferredStatusBarStyle() -> UIStatusBarStyle {
		return UIStatusBarStyle.LightContent
	}
	
	@IBAction func sendButtonPressed(sender: AnyObject) {
		
		if ((self.username.text == "") || (self.email.text == "") || (self.message.text == "")) {
			if (self.message.text == "User message" || self.message.text == "") {
				let alert = UIAlertController(title: "Wrong message!", message:
					"Enter correct new message!", preferredStyle: UIAlertControllerStyle.Alert)
    
				self.presentViewController(alert, animated: false, completion: nil)
				
				alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default,
					handler: {action in
						// Action
				}))
			} else {
				let alert = UIAlertController(title: "One or more fields are empry!", message:
					"Please, enter your message!", preferredStyle: UIAlertControllerStyle.Alert)
				
				self.presentViewController(alert, animated: false, completion: nil)
				
				alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default,
					handler: {action in
						// Action
				}))
			}
		} else {
			if(email.text?.isValidEmail() == false) {
				let alert = UIAlertController(title: "Worng email address!", message:
					"Please, enter correct  email address!", preferredStyle: UIAlertControllerStyle.Alert)
				
				self.presentViewController(alert, animated: false, completion: nil)
				
				alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default,
					handler: {action in
						// Action
				}))
			} else {
				
				let message: Message = Message(username: username.text!,email: email.text!,message: self.message.text!)
				
				let messagesData = NSUserDefaults.standardUserDefaults().objectForKey("userMessages") as? NSData
				
				if let messagesData = messagesData {
					var messagesArray = NSKeyedUnarchiver.unarchiveObjectWithData(messagesData) as! [Message]
					messagesArray.append(message)
					//print(messagesArray)
					let messagesData = NSKeyedArchiver.archivedDataWithRootObject(messagesArray)
					NSUserDefaults.standardUserDefaults().setObject(messagesData, forKey: "userMessages")
				}
				let alert = UIAlertController(title: "Thank you!", message:
					"Thank you for leaving your message!", preferredStyle: UIAlertControllerStyle.Alert)
				
				self.presentViewController(alert, animated: false, completion: nil)
				
				alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default,
					handler: {action in
						self.navigationController?.popToRootViewControllerAnimated(true)
				}))
			}
		}
	}
	
	
	func textFieldShouldReturn(textField:UITextField) -> Bool {   //delegate method
		textField.resignFirstResponder()
		self.navigationController?.popToRootViewControllerAnimated(true)
		return true
	}
	
	
	func textFieldDidBeginEditing(textField: UITextField)  {
		scrollView.setContentOffset(CGPointMake(0.0, 250.0), animated: true)
	}
	
	func textFieldDidEndEditing(textField: UITextField) {
		scrollView.setContentOffset(CGPointMake(0.0, 0.0), animated: true)
	}
}
