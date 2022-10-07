//
//  APODService.swift
//  APODViwer
//
//  Created by Ramon Queiroz dos Santos on 06/10/22.
//

import Foundation

class APODService {
	private static let baseUrl = "https://api.nasa.gov/planetary/apod?"
	private static let apiKey = "hctZtrA5eBRXDNKgEhS4hui5GOVfuip4GbB4k0Mv"
	
	static func getPictureDayURLString() -> URL? {
		let urlComponents = URLComponents(string: "\(baseUrl)api_key=\(apiKey)")
		return urlComponents?.url
	}
	static func getPictureURLString(date: String) -> URL? {
		let urlComponents = URLComponents(string: "\(baseUrl)api_key=\(apiKey)&date=\(date)")
		return urlComponents?.url
	}
	static func getPictureByIntervalURLString(startDate: String,endDate: String ) -> URL? {
		let urlComponents = URLComponents(string: "\(baseUrl)api_key=\(apiKey)&start_date=\(startDate)&end_date=\(endDate)")
		return urlComponents?.url
	}
}
