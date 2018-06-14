//
//  SaleInfo.swift
//  SimpleBookSearch
//
//  Created by Surendra Singh on 5/31/18.
//  Copyright © 2018 Surendra Singh. All rights reserved.
//

import Foundation
struct SaleInfo : Codable {
	let country : String?
	let saleability : String?
	let isEbook : Bool?

	enum CodingKeys: String, CodingKey {

		case country = "country"
		case saleability = "saleability"
		case isEbook = "isEbook"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		country = try values.decodeIfPresent(String.self, forKey: .country)
		saleability = try values.decodeIfPresent(String.self, forKey: .saleability)
		isEbook = try values.decodeIfPresent(Bool.self, forKey: .isEbook)
	}

}
