//
//  Epub.swift
//  SimpleBookSearch
//
//  Created by Surendra Singh on 5/31/18.
//  Copyright © 2018 Surendra Singh. All rights reserved.
//

import Foundation
struct Epub : Codable {
	let isAvailable : Bool?

	enum CodingKeys: String, CodingKey {

		case isAvailable = "isAvailable"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		isAvailable = try values.decodeIfPresent(Bool.self, forKey: .isAvailable)
	}

}
