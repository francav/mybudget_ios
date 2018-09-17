//
//  ExtratoCartaoTableViewCell.swift
//  em3anos
//
//  Created by Victor Franca on 14/09/18.
//  Copyright © 2018 Victor Franca. All rights reserved.
//

import UIKit

class ExtratoCartaoTableViewCell: UITableViewCell {

    @IBOutlet weak var lblBanco: UILabel!
    @IBOutlet weak var lblCategoria: UILabel!
    @IBOutlet weak var lblComentario: UILabel!
    @IBOutlet weak var lblData: UILabel!
    @IBOutlet weak var lblValorCompra: UILabel!
    @IBOutlet weak var btnStatus: UIButton!
    @IBOutlet weak var lblSaldo: UILabel!
    @IBOutlet weak var lblValorParcela: UILabel!
    
    
    @IBOutlet weak var viewContainer: UIView!
    
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
        viewContainer.layer.borderWidth = 1.0
        viewContainer.layer.borderColor = UIColor.white.cgColor
        viewContainer.layer.shadowColor = UIColor.lightGray.cgColor
        viewContainer.layer.shadowRadius = 2.0
        viewContainer.layer.shadowOpacity = 1.0
        viewContainer.layer.shadowOffset = CGSize(width:0, height: 2)
        viewContainer.layer.shadowPath = UIBezierPath(rect: viewContainer.bounds).cgPath
    }


}
