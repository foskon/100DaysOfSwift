//
//  FlagCell.swift
//  HWS-P4
//
//  Created by Carlos Manzanas Navia on 29/10/20.
//  Copyright © 2020 foskon. All rights reserved.
//

import UIKit

class FlagCell: UITableViewCell {
    @IBOutlet private var flag: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        flag.layer.shadowColor = UIColor.black.cgColor
        flag.layer.shadowOffset = CGSize(width: 0, height: 1)
        flag.layer.shadowOpacity = 1
        flag.layer.shadowRadius = 8.0
        flag.clipsToBounds = false
    }
    
    func setup(_ flag: String) {
        self.flag.image = UIImage(named: flag)
    }
}
