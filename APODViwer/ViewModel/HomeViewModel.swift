//
//  HomeViewModel.swift
//  APODViwer
//
//  Created by Ramon Queiroz dos Santos on 06/10/22.
//

import Foundation
import Combine

class HomeViewModel {
	
	private let homeReposiotry: HomeRepositoryProtocol
	var homeSubject = PassthroughSubject<Apod, Error>()
	
	init(homeReposiotry: HomeRepositoryProtocol = HomeRepository()) {
		 self.homeReposiotry = homeReposiotry
	}
	
	func fetchPicture(){
		homeReposiotry.getPicture { [weak self] (result: Result<Apod, Error>) in
			switch result {
			case .success(let data):
				let newData = Apod(date: data.date, explanation: data.explanation, hdurl: data.hdurl, mediaType: data.mediaType, title: data.title, url: data.url)
				self?.homeSubject.send(newData)
			case .failure(let error):
				self?.homeSubject.send(completion: .failure(error))
				print(error)
			}
		}
	}
	
	func fetchPictureBy(date: String){
		homeReposiotry.getPictureBy(date: date) { [weak self] (result: Result<Apod, Error>) in
			switch result {
			case .success(let data):
				let newData = Apod(date: data.date, explanation: data.explanation, hdurl: data.hdurl, mediaType: data.mediaType, title: data.title, url: data.url)
				self?.homeSubject.send(newData)
			case .failure(let error):
				self?.homeSubject.send(completion: .failure(error))
				print(error)
			}
		}
	}
	
}
