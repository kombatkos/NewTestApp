//
//  ModuleBuilder.swift
//  NewTestApp
//
//  Created by Konstantin on 22.07.2020.
//  Copyright © 2020 Konstantin. All rights reserved.
//

import UIKit

protocol Builder {
    static func createMain() -> UIViewController
}

class ModuleBuilder: Builder {
    
    static func createMain() -> UIViewController {
        let view = MainViewController()
        let presenter = MainViewPresenter(view: view)
        view.presenter = presenter
        return view
    }
}
