//
//  Apod.swift
//  APODViwer
//
//  Created by Ramon Queiroz dos Santos on 06/10/22.
//

import Foundation

// MARK: - Welcome
struct Apod: Codable {
	 let date, explanation: String
	 let hdurl: String
	 let mediaType, title: String
	 let url: String

	 enum CodingKeys: String, CodingKey {
		  case date, explanation, hdurl
		  case mediaType = "media_type"
		  case title, url
	 }
}
