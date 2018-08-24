//
//  LancamentoViewController.swift
//  em3anos
//
//  Created by Victor Franca on 23/08/18.
//  Copyright © 18 Victor Franca. All rights reserved.
//

import UIKit

class LancamentoViewController: UIViewController, iCarouselDataSource, iCarouselDelegate
{
    @IBOutlet weak var periodoCarousel: iCarousel!
    @IBOutlet weak var lblPeriodoEscolhido: UILabel!
    
    var periodos: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        periodos = ["08/18", "09/18", "10/18", "11/18", "12/18", "01/19", "02/19", "03/19", "04/19", "05/19", "06/19", "07/19", "08/19", "09/19", "10/19", "11/19", "12/19", "01/20", "02/20", "03/20", "04/20", "05/20", "06/20", "07/20", "08/20", "09/20", "10/20", "11/20", "12/20", "01/21", "02/21", "03/21", "04/21", "05/21", "06/21", "07/21"]
        
        periodoCarousel.type = .coverFlow2
        
        periodoCarousel.reloadData()
        
        // Do any additional setup after loading the view.
    }
    
    func numberOfItems(in carousel: iCarousel) -> Int {
        return periodos.count
    }
    
    func carousel(_ carousel: iCarousel, viewForItemAt index: Int, reusing view: UIView?) -> UIView {
        let tempView = UIView(frame: CGRect(x: 0, y: 0, width: 250, height: 48))
        
        var label: UILabel
        label = UILabel(frame: tempView.bounds)
        label.backgroundColor = .clear
        label.textAlignment = .center
        label.font = label.font.withSize(25)
        label.tag = 1
        label.text = periodos[index]
        tempView.addSubview(label)
        
        return tempView
    }
    
    func carouselDidEndScrollingAnimation(_ carousel: iCarousel) {
        lblPeriodoEscolhido.text = periodos[carousel.currentItemIndex]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
