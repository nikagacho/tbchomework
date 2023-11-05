//
//  TableViewCell.swift
//  SecureNote
//
//  Created by Nikoloz Gachechiladze on 05.11.23.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    
        override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
            super.init(style: style, reuseIdentifier: reuseIdentifier)
        }

        required init?(coder aDecoder: NSCoder) {
            super.init(coder: aDecoder)
        }
    }
