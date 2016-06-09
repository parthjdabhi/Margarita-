//
//  RatedModel.swift
//  Margarita!
//
//  Created by Карпенко Михайло on 27.05.16.
//  Copyright © 2016 Карпенко Михайло. All rights reserved.
//

import UIKit

class RatedModel: NSObject {

	// Simple singletone pattern
	
	static let TopRatedModel = RatedModel()
	
	var itemsArray:[(backgroundImageName: String, titleText: String, subTitleText:String, ratingText: String, starsState: UInt)] =
		[
			("background1.png","Title 1","Subtitle 1","(5,500k)",5),
			("background2.png","Title 2","Subtitle 2","(4,500k)",4),
			("background3.png","Title 3","Subtitle 3","(4,500k)",5),
			("background4.png","Title 4","Subtitle 4","(3,500k)",4),
			("background5.png","Title 5","Subtitle 5","(2,500k)",5),
			("background6.png","Title 6","Subtitle 6","(1,500k)",4),
			("background7.png","Title 7","Subtitle 7","(1,500k)",5),
			("background8.png","Title 8","Subtitle 8","(1,500k)",4),
			("background9.png","Title 9","Subtitle 9","(1,500k)",5),
			("background10.png","Title 10","Subtitle 10","(1,500k)",4),
			("background11.png","Title 11","Subtitle 11","(1,500k)",5),
			("background12.png","Title 12","Subtitle 12","(1,500k)",3)
	]
}
