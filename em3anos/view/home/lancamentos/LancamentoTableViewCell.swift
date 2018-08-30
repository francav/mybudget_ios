//
//  LancamentoTableViewCell.swift
//  em3anos
//
//  Created by Victor Franca on 24/08/18.
//  Copyright © 2018 Victor Franca. All rights reserved.
//

import UIKit

class LancamentoTableViewCell: UITableViewCell {

    @IBOutlet weak var lblData: UILabel!
    @IBOutlet weak var lblConta: UILabel!
    @IBOutlet weak var lblCategoria: UILabel!
    @IBOutlet weak var lblComentario: UILabel!
    @IBOutlet weak var lblValor: UILabel!
    @IBOutlet weak var lblSaldo: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
