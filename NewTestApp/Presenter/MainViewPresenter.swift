//
//  MainViewPresenter.swift
//  NewTestApp
//
//  Created by Konstantin on 22.07.2020.
//  Copyright © 2020 Konstantin. All rights reserved.
//
import DropDown
import Foundation

//MARK: Interface
protocol MainViewProtocol: class {
    func reloadData()
}

protocol MainViewPresenterProtocol: class {
    var pryanik: PryanikModel? { get set }
    var selectorVariants: [Variants]? { get set }
    init(view: MainViewProtocol)
    func loadNetworkData()
    func getMenu(selector: [Variants]? ) -> DropDown
}

//MARK: - Presenter
class MainViewPresenter: MainViewPresenterProtocol {
   
// Properties:
    
    let dataFetcherService = DataFetcherService()
    var view: MainViewProtocol!
    var pryanik: PryanikModel?
    var selectorVariants: [Variants]?
    
    
    required init(view: MainViewProtocol) {
        self.view = view
    }
    
// Buisness Logic:
    
    func loadNetworkData() {
        dataFetcherService.fetchData { data in
            guard let data = data else { return }
            self.pryanik = data
            
            guard let items = self.pryanik?.data else { return }
            for item in items {
                self.selectorVariants = item?.data?.variants
            }
            self.view.reloadData()
        }
        print("Data is loaded!")
    }
    
    func getMenu(selector: [Variants]?) -> DropDown {
        let menu = DropDown()
        menu.textColor = .black
        menu.dataSource = vaariantsString(selector: selector)
        return menu
    }
    
    func vaariantsString(selector: [Variants]?) -> [String] {
        guard let variants = selector else { return [] }
        var resultVariants: [String] = []
        for item in variants {
            resultVariants.append(item.text!)
        }
        return resultVariants
    }
}
