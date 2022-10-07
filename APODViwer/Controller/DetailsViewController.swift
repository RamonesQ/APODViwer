//
//  DetailsViewController.swift
//  APODViwer
//
//  Created by Ramon Queiroz dos Santos on 04/10/22.
//

import UIKit

class DetailsViewController: UIViewController, Coordinating {
	var coordinator: Coordinator?
	
	
	init() {
		super.init(nibName: "DetailsView", bundle: nil)
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

    override func viewDidLoad() {
        super.viewDidLoad()
		 title = "Details"
    }
    
}
