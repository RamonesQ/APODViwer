//
//  File.swift
//  APODViwer
//
//  Created by Ramon Queiroz dos Santos on 04/10/22.
//

import Foundation
import UIKit

class MainCoordinator: Coordinator {
	var navigationController: UINavigationController?

//	func eventOccurred(with type: Event) {
//		switch type {
//		case .detailsButtonTapped:
//			let vc = DetailsViewController()
//			vc.coordinator = self
//			navigationController?.pushViewController(vc, animated: true)
//		case .wrongButtonTapped:
//			let vc = ViewController()
//			vc.coordinator = self
//			navigationController?.pushViewController(vc, animated: true)
//		}
//	}
//
//	func start() {
//		let vc = MainViewController()
//		vc.coordinator = self
//		navigationController?.setViewControllers([vc], animated: false)
//	}
//
//}

//class MainCoordinator: Coordinator {
//	 var childCoordinators: [Coordinator] = []
//	 var navigationController = UINavigationController()

	 func startCoordinator() {
//		  let initialViewController = ViewControllerProvider.moviesViewController
//		  initialViewController.mainCoordinator = self
//		  navigationController.navigationBar.prefersLargeTitles = true
//		  navigationController.pushViewController(initialViewController, animated: false)
		 let vc = MainViewController()
		 		vc.mainCoordinator = self
		// navigationController.setViewControllers([vc], animated: false)
		 navigationController?.pushViewController(vc, animated: false)
	 }
	func toDetails(with date: String){
		let vc = DetailsViewController()
					vc.mainCoordinator = self
		vc.date = date
		navigationController?.pushViewController(vc, animated: true)
	}

}
