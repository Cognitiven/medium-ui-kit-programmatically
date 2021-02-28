//
//  ViewController.swift
//  uikit-programmatically-example
//
//  Created by Martin Lachev on 19.02.21.
//

import UIKit

class MainViewController: UIViewController {

    private(set) lazy var menuView: MainView = {
        MainView()
    }()

    override func loadView() {
        view = menuView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
}

