//
//  MainTableViewCell.swift
//  NewTestApp
//
//  Created by Konstantin on 22.07.2020.
//  Copyright © 2020 Konstantin. All rights reserved.
//

import UIKit

class MainTableViewCell: UITableViewCell {

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .value1, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
