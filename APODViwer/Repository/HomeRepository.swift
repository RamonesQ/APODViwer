//
//  Repository.swift
//  APODViwer
//
//  Created by Ramon Queiroz dos Santos on 06/10/22.
//

import Foundation

protocol HomeRepositoryProtocol {
	func getPicture(completion: @escaping (Result<Apod, Error>) -> Void )
	func getPictureBy(date: String, completion: @escaping (Result<Apod, Error>) -> Void)
}

class HomeRepository: HomeRepositoryProtocol {
	 private let apiManager: APIManagerService
	 
	 init(apiManager: APIManagerService = APIManager()) {
		  self.apiManager = apiManager
	 }
	 
	 func getPicture(completion: @escaping (Result<Apod, Error>) -> Void) {
		 guard let url = APODService.getPictureDayURLString() else { return }
		  apiManager.fetchItems(url: url) { (result: Result<Apod, Error>) in
				switch result {
				case .success(let data):
					 completion(.success(data))
				case .failure(let error):
					 completion(.failure(error))
				}
		  }
	 }
	
	func getPictureBy(date: String, completion: @escaping (Result<Apod, Error>) -> Void) {
		guard let url = APODService.getPictureURLString(date: date)else { return }
		 apiManager.fetchItems(url: url) { (result: Result<Apod, Error>) in
			  switch result {
			  case .success(let data):
					completion(.success(data))
			  case .failure(let error):
					completion(.failure(error))
			  }
		 }
	}
}
