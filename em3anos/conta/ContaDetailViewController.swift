//
//  ContaDetailViewController.swift
//  em3anos
//
//  Created by Victor Franca on 16/08/18.
//  Copyright © 2018 Victor Franca. All rights reserved.
//

import UIKit

class ContaDetailViewController: UIViewController {

    @IBOutlet weak var lblNome: UILabel!
    
    var conta: ContaBanco?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        lblNome.text = conta?.nome
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func removerContaAction(_ sender: Any) {
        
        ServicesFacade().removeConta(conta: conta!){_ in
            self.performSegue(withIdentifier: "unwindToDataTable", sender: self)
        }

    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
