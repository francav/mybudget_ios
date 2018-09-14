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
    @IBOutlet weak var btnStatus: UIButton!
    
    @IBOutlet weak var containerView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        containerView.layer.borderWidth = 1.0
        containerView.layer.borderColor = UIColor.white.cgColor
        containerView.layer.shadowColor = UIColor.lightGray.cgColor
        containerView.layer.shadowRadius = 2.0
        containerView.layer.shadowOpacity = 1.0
        containerView.layer.shadowOffset = CGSize(width:0, height: 2)
        containerView.layer.shadowPath = UIBezierPath(rect: containerView.bounds).cgPath
    }

}
