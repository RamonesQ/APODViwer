//
//  UIImageExtension.swift
//  APODViwer
//
//  Created by Ramon Queiroz dos Santos on 06/10/22.
//

import Foundation
import UIKit

extension UIImageView {
	
	func imageFromServerURL(_ URLString: String, placeHolder: UIImage?) {
		self.image = nil
		if let url = URL(string: URLString) {
			URLSession.shared.dataTask(with: url, completionHandler: { (data, response, error) in
				//print("RESPONSE FROM API: \(response)")
				if error != nil {
					print("ERROR LOADING IMAGES FROM URL: \(String(describing: error))")
					DispatchQueue.main.async {
						self.image = placeHolder
					}
					return
				}
				DispatchQueue.main.async {
					if let data = data {
						if let downloadedImage = UIImage(data: data) {
							
							self.image = downloadedImage
						}
					}
				}
			}).resume()
		}
	}
}
