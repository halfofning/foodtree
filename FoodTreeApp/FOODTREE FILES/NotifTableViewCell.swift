//
//  NotifTableViewCell.swift
//  P1 BUSINESS
//
//  Created by Hui Lin on 30/1/18.
//  Copyright © 2018 Hui Lin. All rights reserved.
//

import UIKit

public class NotifTableViewCell: UITableViewCell {
    @IBOutlet weak var branchLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descLabel: UITextView!
    
    override public func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    public func configure(branchLabel: String, titleLabel: String, descLabel: String) {
        self.branchLabel.text = branchLabel
        self.titleLabel.text = titleLabel
        self.descLabel.text = descLabel
    }
}
