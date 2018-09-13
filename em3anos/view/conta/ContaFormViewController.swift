//
//  ContaViewController.swift
//  em3anos
//
//  Created by Victor Franca on 13/08/18.
//  Copyright © 2018 Victor Franca. All rights reserved.
//

import UIKit

class ContaFormViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    @IBOutlet weak var btnDone: UIBarButtonItem!
    @IBOutlet weak var btnTrash: UIBarButtonItem!
    @IBOutlet weak var txtNome: UITextField!
    @IBOutlet weak var selectTipo: UISegmentedControl!
    
    @IBOutlet weak var lblSaldoInicial: UILabel!
    @IBOutlet weak var txtSaldoInicial: UITextField!
    @IBOutlet weak var saldoHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var txtSaldoConstraint: NSLayoutConstraint!
    @IBOutlet weak var lblSaldoTopContraint: NSLayoutConstraint!
    
    @IBOutlet weak var lblConta: UILabel!
    @IBOutlet weak var txtConta: UITextField!
    
    @IBOutlet weak var lblDiaFechamento: UILabel!
    @IBOutlet weak var txtDiaFechamento: UITextField!

    @IBOutlet weak var lblDiaPagamento: UILabel!
    @IBOutlet weak var txtDiaPagamento: UITextField!
    
    var contaId: Int?
    var conta: Conta?
    
    let numberFormatter = NumberFormatter()
    
    let contasPicker = UIPickerView()
    var contas: [Conta] = []
    
    let diasFechamentoPicker = UIPickerView()
    let diasPagamentoPicker = UIPickerView()
    let dias = [ 1, 2,3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30]
    
    var selectedConta: Conta?
    var selectedDiaFechamento: Int?
    var selectedDiaPagamento: Int?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        numberFormatter.numberStyle = .currency
        numberFormatter.locale = Locale.current
        
        self.navigationItem.rightBarButtonItems?.removeAll()
        self.navigationItem.rightBarButtonItems?.append(btnDone)
        self.navigationItem.rightBarButtonItems?.append(self.btnTrash)
        
        ContaService().findContasCorrente(){contas in
            self.contas = contas
        }
            
        contasPicker.delegate = self
        diasFechamentoPicker.delegate = self
        diasPagamentoPicker.delegate = self
        
        txtConta.inputView = contasPicker
        txtDiaFechamento.inputView = diasFechamentoPicker
        txtDiaPagamento.inputView = diasPagamentoPicker
        
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        carregarDadosComponentes()
    }
    
    fileprivate func updateView() {
        if(self.conta?.tipo != Conta.TIPO_CARTAO){
            self.txtSaldoInicial.isHidden = false
            self.lblSaldoInicial.isHidden = false
            self.txtSaldoConstraint.constant = 30
            self.saldoHeightConstraint.constant = 18
            self.lblSaldoTopContraint.constant = 16
            self.txtConta.isHidden = true
            self.lblConta.isHidden = true
            self.txtDiaFechamento.isHidden = true
            self.lblDiaFechamento.isHidden = true
            self.txtDiaPagamento.isHidden = true
            self.lblDiaPagamento.isHidden = true
        }else{
            self.txtSaldoInicial.isHidden = true
            self.lblSaldoInicial.isHidden = true
            self.txtSaldoConstraint.constant = 0
            self.saldoHeightConstraint.constant = 0
            self.lblSaldoTopContraint.constant = 0
            self.txtConta.isHidden = false
            self.lblConta.isHidden = false
            self.txtDiaFechamento.isHidden = false
            self.lblDiaFechamento.isHidden = false
            self.txtDiaPagamento.isHidden = false
            self.lblDiaPagamento.isHidden = false
        }
        
        view.updateConstraints()
    }
    
    fileprivate func carregarDadosComponentes() {
        if(contaId == nil){
            contaId = -1
            conta = Conta()
            conta?.tipo = Conta.TIPO_BANCO
            self.updateView()
        }else{
            selectTipo.isEnabled = false
            
            ContaService().find(uid: (contaId)!){conta in
                self.conta = conta
                
                DispatchQueue.main.async {
                    let tipo = self.conta!.tipo
                    self.selectTipo.selectedSegmentIndex = Int(tipo!)!
                    self.txtNome.text = self.conta!.nome
                    
                    if(self.conta?.tipo != Conta.TIPO_CARTAO){
                        if(self.conta?.saldoInicial != nil){
                            self.txtSaldoInicial.text = self.numberFormatter.string(from: NSNumber(value: (self.conta?.saldoInicial!)!))
                        }
                    }else{
                        if(self.conta?.contaPagamentoNome != nil){
                            self.txtConta.text = self.conta?.contaPagamentoNome
                        }
                        if(self.conta?.diaFechamento != nil){
                            let diaFechamento = self.conta?.diaFechamento!
                            self.txtDiaFechamento.text = String(diaFechamento!)
                        }
                        if(self.conta?.diaPagamento != nil){
                            let diaPagamento = self.conta?.diaPagamento
                            self.txtDiaPagamento.text = String(diaPagamento!)
                        }
                    }
                    self.updateView()
                }
            }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func cancelButtonTapped(_ sender: UIBarButtonItem) {
        DispatchQueue.main.async {
            self.performSegue(withIdentifier: "unwindToContaDataTable", sender: self)
        }
    }
    
    @IBAction func saveButtonTapped(_ sender: UIBarButtonItem) {
        let saldoString = txtSaldoInicial.text
        let saldoNumber = numberFormatter.number(from: saldoString!)
        let saldoDouble = saldoNumber?.doubleValue
        
        self.conta?.tipo = String(selectTipo.selectedSegmentIndex)
        self.conta?.nome = txtNome.text!
        
        
        if(conta?.tipo != Conta.TIPO_CARTAO){
            self.conta?.saldoInicial = saldoDouble!
        } else{
            if(selectedConta != nil){
                self.conta?.contaPagamentoId = selectedConta!.id
                self.conta?.contaPagamentoNome = selectedConta!.nome
            }
            
            if(selectedDiaFechamento != nil){
                self.conta?.diaFechamento = selectedDiaFechamento!
            }
            
            if(selectedDiaPagamento != nil){
                self.conta?.diaPagamento = selectedDiaPagamento!
            }
        }
        
        ContaService().save(conta: conta!){_ in
            DispatchQueue.main.async {
                self.performSegue(withIdentifier: "unwindToContaDataTable", sender: self)
            }
        }
    }

    @IBAction func removeButtonTapped(_ sender: UIBarButtonItem) {
        ContaService().remove(uid: String(conta!.id!)){_ in
            DispatchQueue.main.async {
                self.performSegue(withIdentifier: "unwindToContaDataTable", sender: self)
            }
        }
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView( _ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if(pickerView == contasPicker){
            return contas.count
        }
            
        else if(pickerView == diasFechamentoPicker || pickerView == diasPagamentoPicker){
            return dias.count
        }
        
        return 0
    }
    
    func pickerView( _ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if(pickerView == contasPicker){
            return contas[row].nome
        }
            
        else if(pickerView == diasFechamentoPicker || pickerView == diasPagamentoPicker){
            return String(dias[row])
        }
        
        return nil
    }
    
    func pickerView( _ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if(pickerView == contasPicker){
            txtConta.text = contas[row].nome
            selectedConta = contas[row]
        }
            
        else if(pickerView == diasFechamentoPicker){
            txtDiaFechamento.text = String(dias[row])
            selectedDiaFechamento = dias[row]
        }
            
        else if(pickerView == diasPagamentoPicker){
            txtDiaPagamento.text = String(dias[row])
            selectedDiaPagamento = dias[row]
        }
    }
    
    @IBAction func selectTipoTapped(_ sender: Any) {
        conta?.tipo = String(selectTipo.selectedSegmentIndex)
        updateView()
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
