//
//  MonitorOrcamentoTableViewCell.swift
//  em3anos
//
//  Created by Victor Franca on 24/08/18.
//  Copyright © 2018 Victor Franca. All rights reserved.
//

import UIKit

class MonitorOrcamentoTableViewCell: UITableViewCell {

    @IBOutlet weak var lblCategoria: UILabel!
    @IBOutlet weak var lblOrcadoRealizado: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
