//
//  ViewController.swift
//  NewTestApp
//
//  Created by Konstantin on 18.07.2020.
//  Copyright © 2020 Konstantin. All rights reserved.
//
import DropDown
import UIKit

class MainViewController: UITableViewController, MainViewProtocol {
    
//MARK: - Properties
    
    var presenter: MainViewPresenterProtocol!
    var currentVariantIndex = 0
    var variantsMenu = DropDown()

//MARK: - Live cicle ViewController
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.loadNetworkData()
        setupTableViewCell()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        variantsMenu = presenter.getMenu(selector: presenter.selectorVariants)
        variantsMenu.selectionAction = { index, title in
            self.currentVariantIndex = index
            print("Selected \(title)")
            self.tableView.reloadData()
        }
        tableView.reloadData()
    }
    
    private func setupTableViewCell() {
        self.tableView.register(MainTableViewCell.self, forCellReuseIdentifier: "Cell")
    }
    
    internal func reloadData() {
        tableView.reloadData()
    }
}

// MARK: - TableView DataSourse

extension MainViewController {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.pryanik?.view.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        if let values = presenter.pryanik?.data,
            let indexName = presenter.pryanik?.view[indexPath.row] {
            for item in values {
                if item?.name == indexName {
                    cell.detailTextLabel?.text = item?.data?.text ?? item?.data?.variants?[self.currentVariantIndex].text
                    cell.imageView?.image = transformImageFromURL(urlString: item?.data?.url)
                }
            }
        }
        return cell
    }
    
}
// MARK: - TableView Delegate
extension MainViewController {
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let name = presenter.pryanik?.view[indexPath.row]
        let cell = tableView.cellForRow(at: indexPath)
        cell?.textLabel?.text = name
        print("Initialized with \(name ?? "nil")")
        if cell?.textLabel?.text == "selector" {
            self.variantsMenu.show()
        }
        tableView.reloadData()
    }
    
    private func transformImageFromURL(urlString: String?) -> UIImage? {
        guard let urlString = urlString else { return nil }
        guard let url = URL(string: urlString) else { return nil }
        guard let imageData = try? Data(contentsOf: url) else { return nil }
        return UIImage(data: imageData)
    }
    
}


