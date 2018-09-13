//
//  CartaoFormViewController.swift
//  em3anos
//
//  Created by Victor Franca on 21/08/18.
//  Copyright © 2018 Victor Franca. All rights reserved.
//

import UIKit

class CartaoFormViewController: UIViewController
//    ,UIPickerViewDelegate, UIPickerViewDataSource
{

    
//    var cartao: Cartao?
//    var contas: [ContaBanco] = []
//
//    var selectedConta: ContaBanco?
//    var selectedDiaFechamento: Int?
//    var selectedDiaPagamento: Int?
//    let dias = [ 1, 2,3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30]
//
//    @IBOutlet weak var txtCartao: UITextField!
//    @IBOutlet weak var txtConta: UITextField!
//    @IBOutlet weak var txtDiaFechamento: UITextField!
//    @IBOutlet weak var txtDiaPagamento: UITextField!
//
//
//    @IBOutlet weak var btnSave: UIBarButtonItem!
//    @IBOutlet weak var btnTrash: UIBarButtonItem!
//
//    let contasPicker = UIPickerView()
//    let diasFechamentoPicker = UIPickerView()
//    let diasPagamentoPicker = UIPickerView()
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        self.navigationItem.rightBarButtonItems?.removeAll()
//        self.navigationItem.rightBarButtonItems?.append(btnSave)
//
//        ContaBancoService().find(){contas in
//            self.contas = contas
//
//            DispatchQueue.main.async {
//                if(self.cartao != nil){
//                    self.txtCartao.text = self.cartao!.nome
//
//                    self.selectedConta = self.contas.filter{ $0.id == self.cartao!.contaPagamentoId }.first
//                    self.txtConta.text = self.selectedConta?.nome
//
//                    self.selectedDiaFechamento = self.cartao!.diaFechamento
//                    if(self.selectedDiaFechamento != nil){
//                        self.txtDiaFechamento.text = String(self.cartao!.diaFechamento!)
//                    }
//
//                    self.selectedDiaPagamento = self.cartao?.diaPagamento
//                    if(self.selectedDiaPagamento != nil){
//                        self.txtDiaPagamento.text = String(self.selectedDiaPagamento!)
//                    }
//                }
//            }
//        }
//
//        self.navigationItem.rightBarButtonItems?.append(self.btnTrash)
//
//        contasPicker.delegate = self
//        diasFechamentoPicker.delegate = self
//        diasPagamentoPicker.delegate = self
//
//        txtConta.inputView = contasPicker
//        txtDiaFechamento.inputView = diasFechamentoPicker
//        txtDiaPagamento.inputView = diasPagamentoPicker
//
//    }
//
//    override func didReceiveMemoryWarning() {
//        super.didReceiveMemoryWarning()
//        // Dispose of any resources that can be recreated.
//    }
//
//
//    @IBAction func cancelAction(_ sender: Any) {
//        DispatchQueue.main.async {
//            self.performSegue(withIdentifier: "unwindToCartaoDataTable", sender: self)
//        }
//    }
//
//    @IBAction func saveAction(_ sender: Any) {
//        let cartao = Cartao()
//        cartao.nome=txtCartao.text!
//        cartao.diaFechamento = selectedDiaFechamento
//        cartao.diaPagamento = selectedDiaPagamento
//        cartao.contaPagamentoId = selectedConta?.id
//
//        if(self.cartao != nil){
//            cartao.id = self.cartao!.id
//        }
//
//        CartaoService().save(cartao: cartao){_ in
//            DispatchQueue.main.async {
//                self.performSegue(withIdentifier: "unwindToCartaoDataTable", sender: self)
//            }
//        }
//    }
//
//    @IBAction func removeAction(_ sender: Any) {
//        CartaoService().remove(uid: String(cartao!.id!)){_ in
//            DispatchQueue.main.async {
//                self.performSegue(withIdentifier: "unwindToCartaoDataTable", sender: self)
//            }
//        }
//    }
//
//
//    func numberOfComponents(in pickerView: UIPickerView) -> Int {
//        return 1
//    }
//
//    func pickerView( _ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
//        if(pickerView == contasPicker){
//            return contas.count
//        }
//
//        else if(pickerView == diasFechamentoPicker || pickerView == diasPagamentoPicker){
//            return dias.count
//        }
//
//        return 0
//    }
//
//    func pickerView( _ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
//        if(pickerView == contasPicker){
//            return contas[row].nome
//        }
//
//        else if(pickerView == diasFechamentoPicker || pickerView == diasPagamentoPicker){
//            return String(dias[row])
//        }
//
//        return nil
//    }
//
//    func pickerView( _ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
//        if(pickerView == contasPicker){
//            txtConta.text = contas[row].nome
//            selectedConta = contas[row]
//        }
//
//        else if(pickerView == diasFechamentoPicker){
//            txtDiaFechamento.text = String(dias[row])
//            selectedDiaFechamento = dias[row]
//        }
//
//        else if(pickerView == diasPagamentoPicker){
//            txtDiaPagamento.text = String(dias[row])
//            selectedDiaPagamento = dias[row]
//        }
//
//    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
