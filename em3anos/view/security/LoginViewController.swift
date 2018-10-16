//
//  LoginViewController.swift
//  em3anos
//
//  Created by Victor Franca on 07/08/18.
//  Copyright © 2018 Victor Franca. All rights reserved.
//

import UIKit
import GoogleSignIn

class LoginViewController: UIViewController, GIDSignInUIDelegate {
    
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtSenha: UITextField!
    
    @IBAction func loginAction(_ sender: UIButton) {
        guard let email = txtEmail.text else {
            return
        }
        guard let password = txtSenha.text else {
            return
        }
        
        let usuario = Usuario()
        usuario.email = email
        usuario.password = password

        UserDefaults.standard.set(nil, forKey: "token")
        SecurityService().login(usuario: usuario){token in
            UserDefaults.standard.set(true, forKey: "status")
            UserDefaults.standard.set(usuario.email, forKey: "email")
            UserDefaults.standard.set(usuario.password, forKey: "password")
            UserDefaults.standard.set(token, forKey: "token")
            Switcher.updateRootVC()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        GIDSignIn.sharedInstance().uiDelegate = self

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
    
    @IBAction func unwindToLogin(segue: UIStoryboardSegue) {
        
    }


}
