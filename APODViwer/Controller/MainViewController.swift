//
//  MainViewController.swift
//  APODViwer
//
//  Created by Ramon Queiroz dos Santos on 04/10/22.
//

import UIKit
import Combine

class MainViewController: UIViewController//, Coordinating
{
	//var coordinator: Coordinator?
	 var mainCoordinator: MainCoordinator?

	var apodResponse: Apod?
	private var subscribers = Set<AnyCancellable>()
	var homeVM = HomeViewModel()
	var apodService = APODService()
	
	
	init() {
		super.init(nibName: "MainView", bundle: nil)
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	@IBOutlet weak var wrongBt: UIButton!
	@IBOutlet weak var button: UIButton!
	@IBOutlet weak var homeImage: UIImageView!
	@IBOutlet weak var titleLabel: UILabel!
	@IBOutlet weak var newImageBt: UIButton!
	@IBOutlet weak var datePicker: UIDatePicker!
	
	override func viewDidLoad() {
        super.viewDidLoad()
		 title = "Home"
		datePicker.maximumDate = Date()
		observeHomeViewModel()
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
	
	private func fetchApod(){
		homeVM.fetchPicture()
	}
	
	private func fetchApodByDate(){
		let formatter = DateFormatter()
		formatter.dateFormat = "yyyy-MM-dd"
		let formattedDate = formatter.string(from: datePicker.date)
		homeVM.fetchPictureBy(date: formattedDate)
	}

	
	private func setupInterface() {
		titleLabel.text = apodResponse?.title
		guard let img = apodResponse?.url else { return }
		if apodResponse?.mediaType == "image"{
			homeImage.imageFromServerURL(img, placeHolder: nil)
		} else {
			homeImage.image = UIImage(named: "apod_small_combined-300x180")
		}
		button.addTarget(self, action: #selector(didTapDetailsButton), for: .touchUpInside)
	}
	
	@IBAction func searchNewPic(_ sender: Any){
		fetchApodByDate()
		setupInterface()
	}
	
	@objc func didTapDetailsButton(){
		if let apodRespDate = apodResponse?.date{
			mainCoordinator?.toDetails(with: apodRespDate)
		}
		//coordinator?.eventOccurred(with: .detailsButtonTapped)
	}
}
