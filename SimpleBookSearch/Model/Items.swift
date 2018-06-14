//
//  Items.swift
//  SimpleBookSearch
//
//  Created by Surendra Singh on 5/31/18.
//  Copyright © 2018 Surendra Singh. All rights reserved.
//

import Foundation
struct Items : Codable {
	let kind : String?
	let id : String?
	let etag : String?
	let selfLink : String?
	let volumeInfo : VolumeInfo?
	let saleInfo : SaleInfo?
	let accessInfo : AccessInfo?

	enum CodingKeys: String, CodingKey {

		case kind = "kind"
		case id = "id"
		case etag = "etag"
		case selfLink = "selfLink"
		case volumeInfo = "volumeInfo"
		case saleInfo = "saleInfo"
		case accessInfo = "accessInfo"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		kind = try values.decodeIfPresent(String.self, forKey: .kind)
		id = try values.decodeIfPresent(String.self, forKey: .id)
		etag = try values.decodeIfPresent(String.self, forKey: .etag)
		selfLink = try values.decodeIfPresent(String.self, forKey: .selfLink)
		volumeInfo = try values.decodeIfPresent(VolumeInfo.self, forKey: .volumeInfo)
		saleInfo = try values.decodeIfPresent(SaleInfo.self, forKey: .saleInfo)
		accessInfo = try values.decodeIfPresent(AccessInfo.self, forKey: .accessInfo) 
	}

}
