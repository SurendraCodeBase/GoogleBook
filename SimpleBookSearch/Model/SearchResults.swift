//
//  SearchResults.swift
//  SimpleBookSearch
//
//  Created by Surendra Singh on 5/31/18.
//  Copyright © 2018 Surendra Singh. All rights reserved.
//

import Foundation
struct SearchResults : Codable {
	let kind : String?
	let totalItems : Int?
	let items : [Items]?

	enum CodingKeys: String, CodingKey {

		case kind = "kind"
		case totalItems = "totalItems"
		case items = "items"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		kind = try values.decodeIfPresent(String.self, forKey: .kind)
		totalItems = try values.decodeIfPresent(Int.self, forKey: .totalItems)
		items = try values.decodeIfPresent([Items].self, forKey: .items)
	}

}
