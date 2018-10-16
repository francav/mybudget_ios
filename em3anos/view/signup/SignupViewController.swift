//
//  SignupViewController.swift
//  em3anos
//
//  Created by Victor Franca on 09/10/18.
//  Copyright © 2018 Victor Franca. All rights reserved.
//

import UIKit

class SignupViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.isHidden = false

        // Do any additional setup after loading the view.
    }
    
    @IBAction func cancelTapped(_ sender: Any) {
        DispatchQueue.main.async {
            self.performSegue(withIdentifier: "unwindToLogin", sender: self)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func signupTapped(_ sender: Any) {
//        guard let email = txtEmail.text else {
//            return
//        }
//        guard let password = txtSenha.text else {
//            return
//        }
        
        let usuario = UsuarioSignup()
        usuario.email = "teste@teste\(Date().description).com"
        usuario.password = "123456"
        usuario.nome = "teste"
        usuario.sobrenome = "sobrenome"
        
        SignupService().signup(usuario: usuario){token in
            UserDefaults.standard.set(true, forKey: "status")
            UserDefaults.standard.set(usuario.email, forKey: "email")
            UserDefaults.standard.set(usuario.password, forKey: "password")
            UserDefaults.standard.set(token, forKey: "token")
            Switcher.updateRootVC()
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
