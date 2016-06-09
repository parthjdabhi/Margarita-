//
//  RatingsTableViewCell.swift
//  Margarita!
//
//  Created by Карпенко Михайло on 27.05.16.
//  Copyright © 2016 Карпенко Михайло. All rights reserved.
//

import UIKit

class RatingsTableViewCell: UITableViewCell {

	@IBOutlet var background: UIImageView!
	@IBOutlet var title: UILabel!
	@IBOutlet var rating: UILabel!
	@IBOutlet var starsView: StarsView!
	
	override func awakeFromNib() {
		super.awakeFromNib()
		// Initialization code
	}
	
	override func setSelected(selected: Bool, animated: Bool) {
		super.setSelected(selected, animated: animated)
		
		// Configure the view for the selected state
	}

}
