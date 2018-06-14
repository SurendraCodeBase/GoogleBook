//
//  ReadingModes.swift
//  SimpleBookSearch
//
//  Created by Surendra Singh on 5/31/18.
//  Copyright © 2018 Surendra Singh. All rights reserved.
//

import Foundation
struct ReadingModes : Codable {
	let text : Bool?
	let image : Bool?

	enum CodingKeys: String, CodingKey {

		case text = "text"
		case image = "image"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		text = try values.decodeIfPresent(Bool.self, forKey: .text)
		image = try values.decodeIfPresent(Bool.self, forKey: .image)
	}

}
