//
//  LoginViewController.swift
//  em3anos
//
//  Created by Victor Franca on 07/08/18.
//  Copyright © 2018 Victor Franca. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBAction func loginAction(_ sender: UIButton) {
        
        let usuario = Usuario(email: "victorhugof@gmail.com", password: "Aclo*x1104")
        
        ServicesFacade().login(usuario){token in
            UserDefaults.standard.set(true, forKey: "status")
            UserDefaults.standard.set(token, forKey: "token")
            Switcher.updateRootVC()
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
