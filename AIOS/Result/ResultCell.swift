//
//  ResultCell.swift
//  AIOS1
//
//  Created by Илья Кадыров on 20.02.2021.
//

import UIKit

class ResultCell: UITableViewCell {

    @IBOutlet weak var dateResult: UILabel!
    @IBOutlet weak var percentResult: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
