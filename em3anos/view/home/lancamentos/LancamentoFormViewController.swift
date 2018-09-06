//
//  LancamentoFormViewController.swift
//  em3anos
//
//  Created by Victor Franca on 27/08/18.
//  Copyright © 2018 Victor Franca. All rights reserved.
//

import UIKit

class LancamentoFormViewController: UIViewController {

    @IBOutlet weak var lblNumberView: UILabel!
    
    @IBOutlet weak var btnCategoria: UIButton!
    @IBOutlet weak var btnConta: UIButton!
    @IBOutlet weak var selectInOut: UISegmentedControl!
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
    
    @IBOutlet weak var btnDate: UIButton!
    
    let dateFormatterPrint = DateFormatter()
    
    var selectedCategoria : Categoria?
    var selectedConta : Conta?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dateFormatterPrint.dateFormat = "dd/MM/yyyy"

        if(datePicker != nil){
            datePicker.date = Date.init()
            btnDate.setTitle(dateFormatterPrint.string(for: datePicker.date), for: UIControlState.normal)
        }
        
        showDatePicker(show: false, animateTime: animateTimeZero)
        
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if(lblNumberView != nil){
            lblNumberView.text = LancamentoValorFormViewController.valorLancamento.formattedWithSeparator
        }
        
        if(selectedCategoria != nil){
            btnCategoria.titleLabel?.text = selectedCategoria?.nome
        }

        if(selectedConta != nil){
            btnConta.titleLabel?.text = selectedConta?.nome
        }
    }
    
    @IBAction func btnSaveTapped(_ sender: Any) {
        let lanc = Lancamento()
        lanc.valor = LancamentoValorFormViewController.valorLancamento
        lanc.data = datePicker.date
        lanc.categoria = String(selectedCategoria!.id!)
        lanc.conta = String(selectedConta!.id!)
        
        LancamentoService().save(lancamento: lanc){_ in
            DispatchQueue.main.async {
                LancamentoValorFormViewController.valorLancamento = 0
                self.performSegue(withIdentifier: "unwindToHomeVC", sender: self)
            }
        }
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "categoriaSelectSegue"){
            let categoriaSelectVC = segue.destination as! CategoriaSelectViewController
            
            categoriaSelectVC.tipoCategoria = selectInOut.selectedSegmentIndex == 0 ?  1 :  0
        }
//        else if(segue.identifier == "contaSelectSegue"){
//            let contaSelectVC = segue.destination as! ContaSelectTableViewController
//            
////            contaSelectVC.tipoCategoria = selectInOut.selectedSegmentIndex == 0 ?  1 :  0
//        }
    }
    
    @IBAction func btnDateTapped(_ sender: Any) {
        showDatePicker(show: !datePickerOpened, animateTime: animateTimeStd)
        
        btnDate.setTitle(dateFormatterPrint.string(for: datePicker.date), for: UIControlState.normal)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
    
}
