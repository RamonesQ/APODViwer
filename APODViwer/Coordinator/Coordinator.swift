//
//  Coordinator.swift
//  CoordinatorApp
//
//  Created by Ramon Queiroz dos Santos on 06/10/22.
//

import Foundation
import UIKit

enum Event {
	case detailsButtonTapped
	case wrongButtonTapped
}

protocol Coordinator {
	var navigationController: UINavigationController? { get set }
	
	func eventOccurred(with type: Event)
	func start()
}

protocol Coordinating {
	var coordinator: Coordinator? { get set }
}
