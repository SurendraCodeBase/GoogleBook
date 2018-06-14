//
//  VolumeInfo.swift
//  SimpleBookSearch
//
//  Created by Surendra Singh on 5/31/18.
//  Copyright © 2018 Surendra Singh. All rights reserved.
//

import Foundation
struct VolumeInfo : Codable {
	let title : String?
	let subtitle : String?
	let authors : [String]?
	let publishedDate : String?
	let industryIdentifiers : [IndustryIdentifiers]?
	let readingModes : ReadingModes?
	let pageCount : Int?
	let printType : String?
	let categories : [String]?
	let averageRating : Int?
	let ratingsCount : Int?
	let maturityRating : String?
	let allowAnonLogging : Bool?
	let contentVersion : String?
	let imageLinks : ImageLinks?
	let language : String?
	let previewLink : String?
	let infoLink : String?
	let canonicalVolumeLink : String?

	enum CodingKeys: String, CodingKey {

		case title = "title"
		case subtitle = "subtitle"
		case authors = "authors"
		case publishedDate = "publishedDate"
		case industryIdentifiers = "industryIdentifiers"
		case readingModes = "readingModes"
		case pageCount = "pageCount"
		case printType = "printType"
		case categories = "categories"
		case averageRating = "averageRating"
		case ratingsCount = "ratingsCount"
		case maturityRating = "maturityRating"
		case allowAnonLogging = "allowAnonLogging"
		case contentVersion = "contentVersion"
		case imageLinks = "imageLinks"
		case language = "language"
		case previewLink = "previewLink"
		case infoLink = "infoLink"
		case canonicalVolumeLink = "canonicalVolumeLink"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		title = try values.decodeIfPresent(String.self, forKey: .title)
		subtitle = try values.decodeIfPresent(String.self, forKey: .subtitle)
		authors = try values.decodeIfPresent([String].self, forKey: .authors)
		publishedDate = try values.decodeIfPresent(String.self, forKey: .publishedDate)
		industryIdentifiers = try values.decodeIfPresent([IndustryIdentifiers].self, forKey: .industryIdentifiers)
		readingModes = try values.decodeIfPresent(ReadingModes.self, forKey: .readingModes)
		pageCount = try values.decodeIfPresent(Int.self, forKey: .pageCount)
		printType = try values.decodeIfPresent(String.self, forKey: .printType)
		categories = try values.decodeIfPresent([String].self, forKey: .categories)
		averageRating = try values.decodeIfPresent(Int.self, forKey: .averageRating)
		ratingsCount = try values.decodeIfPresent(Int.self, forKey: .ratingsCount)
		maturityRating = try values.decodeIfPresent(String.self, forKey: .maturityRating)
		allowAnonLogging = try values.decodeIfPresent(Bool.self, forKey: .allowAnonLogging)
		contentVersion = try values.decodeIfPresent(String.self, forKey: .contentVersion)
		imageLinks = try values.decodeIfPresent(ImageLinks.self, forKey: .imageLinks)
		language = try values.decodeIfPresent(String.self, forKey: .language)
		previewLink = try values.decodeIfPresent(String.self, forKey: .previewLink)
		infoLink = try values.decodeIfPresent(String.self, forKey: .infoLink)
		canonicalVolumeLink = try values.decodeIfPresent(String.self, forKey: .canonicalVolumeLink)
	}

}
