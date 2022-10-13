//
//  DetailsViewController.swift
//  APODViwer
//
//  Created by Ramon Queiroz dos Santos on 04/10/22.
//

import UIKit
import Combine

class DetailsViewController: UIViewController //, Coordinating
{
	var apodResponse: Apod?
	var date: String?
	//var coordinator: Coordinator?
	var mainCoordinator: MainCoordinator?
	private var subscribers = Set<AnyCancellable>()
	var homeVM = HomeViewModel()
	var apodService = APODService()
	
	init() {
		super.init(nibName: "DetailsView", bundle: nil)
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	@IBOutlet weak var titleLb: UILabel!
	@IBOutlet weak var dateLb: UILabel!
	@IBOutlet weak var image: UIImageView!
	@IBOutlet weak var authorLb: UILabel!
	@IBOutlet weak var detailsTf: UITextView!
	
	override func viewDidLoad() {
        super.viewDidLoad()
		 title = "Details"
		observeHomeViewModel()
		fetchApodByDate()
		setupInterface()
    }
    
	private func observeHomeViewModel(){
		homeVM.homeSubject.sink(receiveCompletion: { (resultCompletion) in
			switch resultCompletion {
			case .failure(let error):
				print(error.localizedDescription)
			default: break
			}
		}) { (data) in
			DispatchQueue.main.async {
				self.apodResponse = data
				self.setupInterface()
			}
		}.store(in: &subscribers)
	}
	
	private func fetchApodByDate(){
		homeVM.fetchPictureBy(date: date!)
	}

	
	private func setupInterface() {
		titleLb.text = apodResponse?.date
		if let im = apodResponse?.hdurl{
			image.loadFrom(URLAddress: im)}
		dateLb.text = apodResponse?.title
		detailsTf.text = apodResponse?.explanation
	}
}
