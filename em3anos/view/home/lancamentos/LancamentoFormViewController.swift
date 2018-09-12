//
//  LancamentoFormViewController.swift
//  em3anos
//
//  Created by Victor Franca on 27/08/18.
//  Copyright © 2018 Victor Franca. All rights reserved.
//

import UIKit

class LancamentoFormViewController: UIViewController {

    
    // Componente visual do Valor do lançamento
    @IBOutlet weak var lblNumberView: UILabel!
    
    // Componentes Visuai da data do lançamento
    @IBOutlet weak var btnDate: UIButton!
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var datePickerMarginTop: NSLayoutConstraint!
    @IBOutlet weak var datePickerHeight: NSLayoutConstraint!
    var datePickerOpened: Bool = false    // state variable
    let datePickerHeightOpened: CGFloat = 214
    let datePickerHeightClosed: CGFloat = 0
    let datePickerMarginTopOpened: CGFloat = 0  // 18 (see below)
    let datePickerMarginTopClosed: CGFloat = 0
    let animateTimeStd: TimeInterval = 0.5
    let animateTimeZero: TimeInterval = 0.0

    // Componente visual da categoria do lançamento
    @IBOutlet weak var btnCategoria: UIButton!
    
    // Componente Visual da Conta do Lançamento(pode ser conta origem quando transferência)
    @IBOutlet weak var btnConta: UIButton!
    
    // Componente Visual da conta Destino quando transferência
    @IBOutlet weak var btnContaDestino: UIButton!
    
    // Componente Visual Receita/Despesa
    @IBOutlet weak var selectInOut: UISegmentedControl!
    @IBOutlet weak var selectInOutHeight: NSLayoutConstraint!
    
    // Componente Visual Status(Agendado/Pago)
    @IBOutlet weak var selectStatus: UISegmentedControl!
    
    // Componente Visual da quantidade de parcelas quando compra em Cartão de Crédito
    @IBOutlet weak var lblParcelas: UILabel!
    // Componente Visual de incremento/decremento quantidade de parcelas quando compra em Cartão de Crétido
    @IBOutlet weak var btnParcelasStepper: UIStepper!
    // View agregadora de componentes de parcelas
    @IBOutlet weak var viewParcelas: UIView!
    // Constraint da altura da view de parcelas
    @IBOutlet weak var viewParcelasHeight: NSLayoutConstraint!
    
    // Componente Visual do comentário do lançamento
    @IBOutlet weak var txtComentario: UITextView!
    
    let dateFormatterPrint = DateFormatter()
    
    var selectedCategoria : Categoria?
    var selectedConta : Conta?
    var selectedContaDestino : Conta?

    var isTransferencia = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        inicializarComponentes()
        
        selecionarPadraoTransferenciaAjuste()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        preencherInformacoesVisuais()
    }
    
    fileprivate func inicializarComponentes() {
        // inicializando componentes de data
        dateFormatterPrint.dateFormat = "dd/MM/yyyy"
        if(datePicker != nil){
            datePicker.date = Date.init()
            btnDate.setTitle(dateFormatterPrint.string(for: datePicker.date), for: UIControlState.normal)
        }
        showDatePicker(show: false, animateTime: animateTimeZero)
        
        // inicializando componente de incremento/decremento de parcelas
        btnParcelasStepper.wraps = true
        btnParcelasStepper.autorepeat = true
        btnParcelasStepper.maximumValue = 36
        btnParcelasStepper.minimumValue = 1
    }
    
    fileprivate func preencherInformacoesVisuais() {
        if(lblNumberView != nil){
            lblNumberView.text = LancamentoValorFormViewController.valorLancamento.formattedWithSeparator
        }
        
        if(selectedCategoria != nil){
            btnCategoria.titleLabel?.text = selectedCategoria?.nome
        }
        
        if(selectedConta != nil){
            btnConta.titleLabel?.text = selectedConta?.nome
        }
        
        if(selectedContaDestino != nil){
            btnContaDestino.titleLabel?.text = selectedContaDestino?.nome
        }
        
        viewParcelas.isHidden = selectedConta?.tipo == "1" ? false :  true
        viewParcelasHeight.constant = selectedConta?.tipo == "1" ? 40 :  0
        viewParcelas.needsUpdateConstraints()
    }
    
    fileprivate func selecionarPadraoTransferenciaAjuste() {
        if(isTransferencia){
            selectInOut.isHidden = true
            selectInOutHeight.constant = 0
            btnConta.titleLabel?.text = "Conta Origem"
            btnContaDestino.isHidden = false
            btnCategoria.isHidden = true
        }else{
            selectInOut.isHidden = false
            selectInOutHeight.constant = 28
            btnConta.titleLabel?.text = "Conta"
            btnContaDestino.isHidden = true
            btnCategoria.isHidden = false
        }
        
        btnContaDestino.titleLabel?.text = "Conta Destino"
        btnCategoria.titleLabel?.text = "Categoria"
        
        selectedConta = nil
        selectedContaDestino = nil
        selectedCategoria = nil
    }
    
    // Ações para Seleção de data
    @IBAction func btnDateTapped(_ sender: Any) {
        showDatePicker(show: !datePickerOpened, animateTime: animateTimeStd)
        btnDate.setTitle(dateFormatterPrint.string(for: datePicker.date), for: UIControlState.normal)
    }
    func showDatePicker(show: Bool, animateTime: TimeInterval) {
        if(datePicker != nil){
            // set state variable
            datePickerOpened = show
            
            // this makes the datePicker disappear from the screen BUT leaves the space still occupied
            // this is not strictly necessary but it will make the appearance more tidy
            self.datePicker.isHidden = !show
            
            // animate the datePicker open/hide - this is the where the constraints are modified
            UIView.animate(withDuration: animateTime, animations: {
                
                // toggle open/close the datePicker
                self.datePickerHeight.constant = (show ? self.datePickerHeightOpened : self.datePickerHeightClosed)
                
                // toggle open/close the datePicker top margin
                // as it turns out for me, it looked better in my set up to have top margin zero all the time but I'm leaving the code here in case I need it later
                self.datePickerMarginTop.constant = (show ? self.datePickerMarginTopOpened : self.datePickerMarginTopClosed)
                
                // this I understand tells the view to update
                self.view.layoutIfNeeded()
            })
        }
    }
    
    // Selecionado Lançamento Padrão/Transferência/Ajuste
    @IBAction func btnTipoLancamentoTapped(_ sender: Any) {
        let tipoSelecionado = (sender as! UISegmentedControl).selectedSegmentIndex
        if(tipoSelecionado == 1){
            isTransferencia = true
        }else{
            isTransferencia = false
        }
        selecionarPadraoTransferenciaAjuste()
    }
    
    // Selecionando Receita/Despesa
    @IBAction func btnReceitaDespesaTapped(_ sender: Any) {
        selectedCategoria = nil
        btnCategoria.titleLabel?.text = "Categoria"
        
        selectedConta = nil
        btnConta.titleLabel?.text = "Conta"
        
        selectedContaDestino = nil
        btnContaDestino.titleLabel?.text = "Conta Destino"
    }
    
    // Incrementando/Decrementando quantidade de parcelas
    @IBAction func parcelasStepperTapped(_ sender: UIStepper) {
        lblParcelas.text = Int(sender.value).description
    }
    
    // Salvar lançamento
    @IBAction func btnSaveTapped(_ sender: Any) {
        let lanc = Lancamento()
        lanc.valor = LancamentoValorFormViewController.valorLancamento
        
        lanc.data = datePicker.date
        if(selectedCategoria != nil){
            lanc.categoria = String(selectedCategoria!.id!)
        }
        lanc.conta = String(selectedConta!.id!)
        lanc.tipo = selectInOut.selectedSegmentIndex == 0 ?  "1" :  "0"
        lanc.status = selectStatus.selectedSegmentIndex == 0 ?  "1" :  "2"
        lanc.comentario = txtComentario.text != nil ? txtComentario.text : nil
        
        lanc.parcelas = selectedConta?.tipo == "1" ? Int(btnParcelasStepper.value) :  nil
        
        if(isTransferencia){
            let contaDestino:Int? = selectedContaDestino?.id
            lanc.contaDestino = String(contaDestino!)
        }
        
        LancamentoService().save(lancamento: lanc){_ in
            DispatchQueue.main.async {
                LancamentoValorFormViewController.valorLancamento = 0
                self.performSegue(withIdentifier: "unwindToHomeVC", sender: self)
            }
        }
    }
    
    // Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "categoriaSelectSegue"){
            let categoriaSelectVC = segue.destination as! CategoriaSelectViewController
            
            categoriaSelectVC.tipoCategoria = selectInOut.selectedSegmentIndex == 0 ?  1 :  0
            
        }
        else if(segue.identifier == "contaSelectSegue"){
            let contaSelectVC = segue.destination as! ContaSelectTableViewController
            
            if(isTransferencia){
                contaSelectVC.tipo = 1
            }else{
                contaSelectVC.tipo = selectInOut.selectedSegmentIndex == 0 ?  0 :  1
            }
            
            contaSelectVC.isContaDestino = false
        }else if(segue.identifier == "contaDestinoSelectSegue"){
            let contaSelectVC = segue.destination as! ContaSelectTableViewController
            
            contaSelectVC.tipo = selectInOut.selectedSegmentIndex == 0 ?  0 :  1
            contaSelectVC.isContaDestino = false
            contaSelectVC.isContaDestino = true
            
            contaSelectVC.tipo = 1
        }
            
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
