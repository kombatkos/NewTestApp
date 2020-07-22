//
//  PryanikModel.swift
//  NewTestApp
//
//  Created by Konstantin on 18.07.2020.
//  Copyright © 2020 Konstantin. All rights reserved.
//

import Foundation

struct PryanikModel: Decodable {
    let data: [Name?]
    let view: [String]
}

struct Name: Decodable {
    let name: String?
    let data: DataName?
}

struct DataName: Decodable {
    let text: String?
    let url: String?
    let variants: [Variants]?
}

struct Variants: Decodable {
    let text: String?
}

