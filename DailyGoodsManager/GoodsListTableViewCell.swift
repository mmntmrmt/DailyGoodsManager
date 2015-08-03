//
//  GoodsListTableViewCell.swift
//  DailyGoodsManager
//
//  Created by Ryo Morimoto on 2015/08/01.
//  Copyright (c) 2015年 Ryo Morimoto. All rights reserved.
//

import UIKit

class GoodsListTableViewCell: UITableViewCell {

    @IBOutlet weak var goodsNameLabel: UILabel!
    @IBOutlet weak var lastAddDateLabel: UILabel!
    @IBOutlet weak var nextNoticeDateLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
