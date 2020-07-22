//
//  DataFetcherService.swift
//  NewTestApp
//
//  Created by Konstantin on 19.07.2020.
//  Copyright © 2020 Konstantin. All rights reserved.
//

import Foundation

class DataFetcherService {
    
    var networkDataFetcher: DataFetcher
    
    init(networkDataFetcher: DataFetcher = NetworkDataFetcher()) {
        
        self.networkDataFetcher = networkDataFetcher
    }
    
    func fetchData(completion: @escaping (PryanikModel?) -> Void) {
        
        let urlString = "https://pryaniky.com/static/json/sample.json"
        networkDataFetcher.fetchGenericJSONData(urlString: urlString, response: completion)
    }
    
}
