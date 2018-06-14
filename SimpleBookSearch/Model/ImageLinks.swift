//
//  ImageLinks.swift
//  SimpleBookSearch
//
//  Created by Surendra Singh on 5/31/18.
//  Copyright © 2018 Surendra Singh. All rights reserved.
//

import Foundation
struct ImageLinks : Codable {
	let smallThumbnail : String?
	let thumbnail : String?

	enum CodingKeys: String, CodingKey {

		case smallThumbnail = "smallThumbnail"
		case thumbnail = "thumbnail"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		smallThumbnail = try values.decodeIfPresent(String.self, forKey: .smallThumbnail)
		thumbnail = try values.decodeIfPresent(String.self, forKey: .thumbnail)
	}
}
