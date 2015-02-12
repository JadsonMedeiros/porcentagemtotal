//
//  ViewController.swift
//  porcentagemtotal
//
//  Created by Jadson Medeiros on 03/01/15.
//  Copyright (c) 2015 Jadson Medeiros. All rights reserved.
//

import UIKit
import Social
import MessageUI

class ViewController: UIViewController, UITextFieldDelegate, MFMailComposeViewControllerDelegate, MFMessageComposeViewControllerDelegate, UIActionSheetDelegate {
    
    //Outlet's
    
    @IBOutlet weak var campo1: UITextField!
    @IBOutlet weak var campo2: UITextField!
    @IBOutlet weak var resultado: UILabel!
    @IBOutlet weak var valorx: UILabel!
    @IBOutlet weak var valory: UILabel!
    
    //Botões
    
    @IBOutlet weak var botao1: UIButton!
    @IBOutlet weak var botao2: UIButton!
    @IBOutlet weak var botao3: UIButton!
    @IBOutlet weak var botao4: UIButton!
    @IBOutlet weak var botao5: UIButton!
    @IBOutlet weak var botao6: UIButton!
    @IBOutlet weak var botao7: UIButton!
    @IBOutlet weak var botao8: UIButton!
    
    //Variáveis temporárias
    
    var temp1:Float = 0
    var temp2:Float = 0
    
    //Funções e alertas
    
    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        self.view.endEditing(true)
    }
    
    func desenharBotao(){
        botao1.layer.cornerRadius = 10
        botao1.layer.borderColor = (UIColor(red: 0.847637, green: 0.0, blue: 0.0, alpha: 1.0)).CGColor
        botao1.layer.borderWidth = 1.1
        botao1.backgroundColor = UIColor.clearColor()
        
        botao2.layer.cornerRadius = 10
        botao2.layer.borderColor = (UIColor(red: 0.847637, green: 0.0, blue: 0.0, alpha: 1.0)).CGColor
        botao2.layer.borderWidth = 1.1
        botao2.backgroundColor = UIColor.clearColor()
        
        botao3.layer.cornerRadius = 10
        botao3.layer.borderColor = (UIColor(red: 0.847637, green: 0.0, blue: 0.0, alpha: 1.0)).CGColor
        botao3.layer.borderWidth = 1.1
        botao3.backgroundColor = UIColor.clearColor()
        
        botao4.layer.cornerRadius = 10
        botao4.layer.borderColor = (UIColor(red: 0.847637, green: 0.0, blue: 0.0, alpha: 1.0)).CGColor
        botao4.layer.borderWidth = 1.1
        botao4.backgroundColor = UIColor.clearColor()
        
        botao5.layer.cornerRadius = 10
        botao5.layer.borderColor = (UIColor(red: 0.847637, green: 0.0, blue: 0.0, alpha: 1.0)).CGColor
        botao5.layer.borderWidth = 1.1
        botao5.backgroundColor = UIColor.clearColor()
        
        botao6.layer.cornerRadius = 10
        botao6.layer.borderColor = (UIColor(red: 0.847637, green: 0.0, blue: 0.0, alpha: 1.0)).CGColor
        botao6.layer.borderWidth = 1.1
        botao6.backgroundColor = UIColor.clearColor()
        
        botao7.layer.cornerRadius = 10
        botao7.layer.borderColor = (UIColor(red: 0.847637, green: 0.0, blue: 0.0, alpha: 1.0)).CGColor
        botao7.layer.borderWidth = 1.1
        botao7.backgroundColor = UIColor.clearColor()
        
        botao8.layer.cornerRadius = 10
        botao8.layer.borderColor = (UIColor(red: 0.847637, green: 0.0, blue: 0.0, alpha: 1.0)).CGColor
        botao8.layer.borderWidth = 1.1
        botao8.backgroundColor = UIColor.clearColor()
        
        resultado.layer.cornerRadius = 10
        resultado.layer.borderWidth = 1.1
        resultado.backgroundColor = UIColor(red:210/255.0, green:0/255.0, blue:6/255.0, alpha: 1)
        resultado.layer.borderColor = (UIColor(red:210/255.0, green:0/255.0, blue:6/255.0, alpha: 1)).CGColor
        
        botao1.alpha = 0
        botao2.alpha = 0
        botao3.alpha = 0
        botao4.alpha = 0
        botao5.alpha = 0
        botao6.alpha = 0
        botao7.alpha = 0
        botao8.alpha = 0
        
        botao1.tintColor = UIColor.redColor()
        botao2.tintColor = UIColor.redColor()
        botao3.tintColor = UIColor.redColor()
        botao4.tintColor = UIColor.redColor()
        botao5.tintColor = UIColor.redColor()
        botao6.tintColor = UIColor.redColor()
        botao7.tintColor = UIColor.redColor()
        botao8.tintColor = UIColor.redColor()
        
    }
    
    func navColor(){
        
        var nav = self.navigationController?.navigationBar
        nav?.barTintColor = UIColor(red: 0.847637, green: 0.0, blue: 0.0, alpha: 1.0)
        nav?.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.whiteColor()]
        nav?.barStyle = UIBarStyle.Black
        nav?.tintColor = UIColor.whiteColor()
        
    }
    
    func doneAction(){
        self.campo1.resignFirstResponder()
        self.campo2.resignFirstResponder()
        
    }
    
    func alertField(){
        
        if (campo1.text == "" || campo2.text == ""){
            let alert = UIAlertController(title: "Atenção!", message: "Existem campos não preenchidos.", preferredStyle: .Alert)
            let action = UIAlertAction(title: "OK", style: .Default, handler: nil)
            alert.addAction(action)
            self.presentViewController(alert, animated: true, completion: nil)
            
        }
        
    }
    
    func barraTeclado(){
        var toolbar = UIToolbar(frame: CGRectMake(0, 0, self.view.bounds.size.width, 44))
        toolbar.backgroundColor = UIColor(red:151/255.0, green:151/255.0, blue:151/255.0, alpha: 1)
        toolbar.barStyle = UIBarStyle.BlackTranslucent
        
        var buttonHide = UIBarButtonItem(title: "SAIR", style: UIBarButtonItemStyle.Plain, target: self, action: "doneAction")
        buttonHide.tintColor = UIColor.whiteColor()
        
        var segundoItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.FlexibleSpace,
            target: nil, action: nil)
        
        toolbar.items = [segundoItem, buttonHide]
        toolbar.sizeToFit()
        toolbar.translucent = true
        self.campo1.inputAccessoryView = toolbar
        self.campo2.inputAccessoryView = toolbar
        
    }
    
    func temps(){
        
        var calculoAjuste1 = campo1.text.stringByReplacingOccurrencesOfString(",", withString: ".", options: nil, range: nil)
        
        var calculoAjuste2 = campo2.text.stringByReplacingOccurrencesOfString(",", withString: ".", options: nil, range: nil)
        
        var calculo1 = NSString(string: calculoAjuste1).floatValue
        
        var calculo2 = NSString(string: calculoAjuste2).floatValue
        
        temp1 = calculo1
        temp2 = calculo2
        
    }
    
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        let invalidCharacters = NSCharacterSet(charactersInString: "0123456789.,").invertedSet
        if let range = string.rangeOfCharacterFromSet(invalidCharacters, options: nil, range:Range<String.Index>(start: string.startIndex, end: string.endIndex)) {
            return false
        }
        
        return true
    }
    
    //Ações
    @IBAction func compartilhar(sender:AnyObject){
        
        
        let optionMenu = UIAlertController(title: nil, message: "COMPARTILHE:", preferredStyle: .ActionSheet)
        
        
        let facebook = UIAlertAction(title: "Facebook", style: .Default, handler: {
            (alert: UIAlertAction!) -> Void in
            if SLComposeViewController.isAvailableForServiceType(SLServiceTypeFacebook){
                var facesheet:SLComposeViewController = SLComposeViewController(forServiceType: SLServiceTypeFacebook)
                facesheet.setInitialText(self.resultado.text)
                self.presentViewController(facesheet, animated: true, completion: nil)
            }else{
                var alert = UIAlertController(title: "Você não possui uma Conta!", message: "Por favor crie uma conta no Facebook para compartilhar o resultado", preferredStyle: UIAlertControllerStyle.Alert)
                alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
                self.presentViewController(alert, animated: true, completion: nil)
                
            }
            
        })
        let twitter = UIAlertAction(title: "Twitter", style: .Default, handler: {
            (alert: UIAlertAction!) -> Void in
            if SLComposeViewController.isAvailableForServiceType(SLServiceTypeTwitter){
                var tweetsheet:SLComposeViewController = SLComposeViewController(forServiceType: SLServiceTypeTwitter)
                tweetsheet.setInitialText(self.resultado.text)
                self.presentViewController(tweetsheet, animated: true, completion: nil)
            }else{
                var alert = UIAlertController(title: "Você não possui uma Conta!", message: "Por favor crie uma conta no Twitter para compartilhar o resultado", preferredStyle: UIAlertControllerStyle.Alert)
                
                alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
                
                self.presentViewController(alert, animated: true, completion: nil)
            }
            
        })
        let email = UIAlertAction(title: "Email", style: .Default, handler: {
            (alert: UIAlertAction!) -> Void in
            
            var mc: MFMailComposeViewController = MFMailComposeViewController()
            mc.mailComposeDelegate = self
            mc.setSubject("Cálculo de Porcentagem")
            mc.setMessageBody(self.resultado.text, isHTML: false)
            mc.setToRecipients([""])
            
            self.presentViewController(mc, animated: true, completion: nil)
            
        })
        let sms = UIAlertAction(title: "SMS", style: .Default, handler: {
            (alert: UIAlertAction!) -> Void in
            if (MFMessageComposeViewController.canSendText()) {
                let controller = MFMessageComposeViewController();
                controller.body = self.resultado.text;
                controller.recipients = [""]
                controller.messageComposeDelegate = self;
                self.presentViewController(controller, animated: true, completion: nil);
            } else {
                var alert = UIAlertController(title: "Erro de envio!", message: "Seu dispositivo não suporta envio de sms.", preferredStyle: UIAlertControllerStyle.Alert)
                
                alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
                
                self.presentViewController(alert, animated: true, completion: nil)
                
            }
            
        })
        //
        let cancelar = UIAlertAction(title: "Cancelar", style: .Cancel, handler: {
            (alert: UIAlertAction!) -> Void in
            return
        })
        
        // 4
        optionMenu.addAction(facebook)
        optionMenu.addAction(twitter)
        optionMenu.addAction(email)
        optionMenu.addAction(sms)
        optionMenu.addAction(cancelar)
        
        if let popoverController = optionMenu.popoverPresentationController {
            popoverController.barButtonItem = sender as UIBarButtonItem
        }
        
        // 5
        self.presentViewController(optionMenu, animated: true, completion: nil)
    }
    
    @IBAction func inverter(sender: UIButton) {
        
        var temp = campo1.text
        campo1.text = campo2.text
        campo2.text = temp
        
    }
    
    @IBAction func limpar(sender: UIButton) {
        campo1.text = ""
        campo2.text = ""
        resultado.text = ""
        
    }
    
    //Calculos
    
    @IBAction func calcular(sender: UIButton){
        if(sender.tag == 1){
            
            
            if (campo1.text == "" || campo2.text == ""){
                
                alertField()
                
            }else{
                
                temps()
                
                var calculado = temp1 / 100 * temp2
                
                if (isnan(calculado)){
                    alertField()
                    
                }else{
                    
                    if (calculado % 1 == 0 ){
                        var ajuste = NSString(format:"%.0f", calculado)
                        resultado.text = "\(campo1.text)% de \(campo2.text) = \(ajuste)"
                        
                    }
                    else{
                        
                        var ajuste = NSString(format:"%.2f", calculado)
                        resultado.text = "\(campo1.text)% de \(campo2.text) = \(ajuste)"
                        
                        
                    }
                    
                }
            }
            
            
            
        }
            
        else if(sender.tag == 2){
            if (campo1.text == "" || campo2.text == ""){
                
                alertField()
                
            }else{
                
                temps()
                
                var calculado = (temp1 / 100) * temp2 + temp2
                
                if (isnan(calculado)){
                    alertField()
                    
                }else{
                    
                    if (calculado % 1 == 0 ){
                        var ajuste = NSString(format:"%.0f", calculado)
                        resultado.text = "\(campo1.text)% de \(campo2.text) + \(campo2.text) = \(ajuste)"
                        
                    }
                    else{
                        
                        var ajuste = NSString(format:"%.2f", calculado)
                        resultado.text = "\(campo1.text)% de \(campo2.text) + \(campo2.text) = \(ajuste)"
                        
                    }
                }
            }
        }
            
            
        else if(sender.tag == 3){
            
            if (campo1.text == "" || campo2.text == ""){
                
                alertField()
                
            }else{
                
                temps()
                
                var calculado =  (temp1 * 100) / temp2
                
                if (isnan(calculado)){
                    alertField()
                    
                }else{
                    
                    if (calculado % 1 == 0 ){
                        var ajuste = NSString(format:"%.0f", calculado)
                        resultado.text = "\(campo1.text) de \(campo2.text) = \(ajuste)%"
                        
                    }
                    else{
                        
                        var ajuste = NSString(format:"%.2f", calculado)
                        resultado.text = "\(campo1.text) de \(campo2.text) = \(ajuste)%"
                        
                    }
                }
            }
        }
            
            
        else if(sender.tag == 4){
            if (campo1.text == "" || campo2.text == ""){
                
                alertField()
                
            }else{
                
                temps()
                
                var calculado =  temp1 + ((temp2 / 100) * temp1)
                
                if (isnan(calculado)){
                    alertField()
                    
                }else{
                    
                    if (calculado % 1 == 0 ){
                        var ajuste = NSString(format:"%.0f", calculado)
                        resultado.text = "\(campo1.text) + \(campo2.text)% de \(campo1.text) = \(ajuste)"
                        
                    }
                    else{
                        
                        var ajuste = NSString(format:"%.2f", calculado)
                        resultado.text = "\(campo1.text) + \(campo2.text)% de \(campo1.text) = \(ajuste)"
                        
                    }
                }
                
            }
        }
            
            
        else if(sender.tag == 5){
            if (campo1.text == "" || campo2.text == ""){
                
                alertField()
                
            }else{
                
                temps()
                
                var calculado = temp1 * 100 / temp2
                
                if (isnan(calculado)){
                    alertField()
                    
                }else{
                    
                    
                    if (calculado % 1 == 0 ){
                        var ajuste = NSString(format:"%.0f", calculado)
                        resultado.text = "\(campo1.text) é \(campo2.text)% de \(ajuste)"
                        
                    }
                    else{
                        
                        var ajuste = NSString(format:"%.2f", calculado)
                        resultado.text = "\(campo1.text) é \(campo2.text)% de \(ajuste)"
                        
                    }
                }
            }
            
            
            
        }
            
            
        else if(sender.tag == 6){
            if (campo1.text == "" || campo2.text == ""){
                
                alertField()
                
            }else{
                
                temps()
                
                var calculado = ((temp1 / 100 - 1) * temp2) * -1
                
                if (isnan(calculado)){
                    alertField()
                    
                }else{
                    
                    if (calculado % 1 == 0 ){
                        var ajuste = NSString(format:"%.0f", calculado)
                        resultado.text = "\(campo1.text)% de \(campo2.text) - \(campo2.text) = \(ajuste)"
                        
                    }
                    else{
                        
                        var ajuste = NSString(format:"%.2f", calculado)
                        resultado.text = "\(campo1.text)% de \(campo2.text) - \(campo2.text) = \(ajuste)"
                        
                    }
                }
            }
            
        }
            
            
        else if(sender.tag == 7){
            if (campo1.text == "" || campo2.text == ""){
                
                alertField()
                
            }else{
                
                temps()
                
                var calculado =  fabsf(((temp1 / temp2) * 100) - 100)
                
                if (isnan(calculado)){
                    alertField()
                    
                }else{
                    
                    if (calculado % 1 == 0 ){
                        var ajuste = NSString(format:"%.0f", calculado)
                        
                        var rapid = (campo1.text as NSString).floatValue
                        var rapid2 = (campo2.text as NSString).floatValue
                        
                        if(rapid > rapid2){
                            resultado.text = "Atual: \(campo1.text), antes: \(campo2.text), subiu: \(ajuste)%"
                            
                        }
                        if(rapid < rapid2){
                            resultado.text = "Atual: \(campo1.text), antes: \(campo2.text), caiu: \(ajuste)%"
                            
                        }
                        if(rapid == rapid2){
                            resultado.text = "Atual: \(campo1.text), antes: \(campo2.text), ficou: \(ajuste)%"
                            
                        }
                    }
                    else{
                        
                        var ajuste = NSString(format:"%.2f", calculado)
                        var rapid = (campo1.text as NSString).floatValue
                        var rapid2 = (campo2.text as NSString).floatValue
                        
                        if(rapid > rapid2){
                            resultado.text = "Atual: \(campo1.text), antes: \(campo2.text), subiu: \(ajuste)%"
                            
                        }
                        if(rapid < rapid2){
                            resultado.text = "Atual: \(campo1.text), antes: \(campo2.text), caiu: \(ajuste)%"
                            
                        }
                        if(rapid == rapid2){
                            resultado.text = "Atual: \(campo1.text), antes: \(campo2.text), ficou: \(ajuste)%"
                            
                        }
                        
                    }
                }
                
            }
            
        }
            
            
        else if(sender.tag == 8){
            if (campo1.text == "" || campo2.text == ""){
                
                alertField()
                
            }else{
                
                temps()
                
                var calculado =  fabsf(((temp2 / 100) * temp1) - temp1)
                
                if (isnan(calculado)){
                    alertField()
                    
                }else{
                    
                    if (calculado % 1 == 0 ){
                        var ajuste = NSString(format:"%.0f", calculado)
                        resultado.text = "\(campo1.text) - \(campo2.text)% de \(campo1.text) = \(ajuste)"
                        
                    }
                    else{
                        
                        var ajuste = NSString(format:"%.2f", calculado)
                        resultado.text = "\(campo1.text) - \(campo2.text)% de \(campo1.text) = \(ajuste)"
                        
                    }
                }
            }
            
        }
        
    }
    
    //Carregar view inicial
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        campo1.tintColor = UIColor.whiteColor();
        campo2.tintColor = UIColor.whiteColor();
        
        barraTeclado()
        navColor()
        desenharBotao()
        
    }
    
    override func viewDidAppear(animated: Bool) {
        
        super.viewDidAppear(animated)
        
        self.navigationController?.navigationBar.titleTextAttributes = [NSFontAttributeName: UIFont(name: "Heiti SC", size: 17)!,  NSForegroundColorAttributeName: UIColor.whiteColor()]
        
        valorx.font = UIFont(name: "Heiti SC", size: 17)
        valory.font = UIFont(name: "Heiti SC", size: 17)
        resultado.font = UIFont(name: "Heiti SC", size: 14)
        
        
        UIView.animateWithDuration(2.3, animations: { () -> Void in
            
            self.botao1.alpha = 1.0
            self.botao2.alpha = 1.0
            self.botao3.alpha = 1.0
            self.botao4.alpha = 1.0
            self.botao5.alpha = 1.0
            self.botao6.alpha = 1.0
            self.botao7.alpha = 1.0
            self.botao8.alpha = 1.0
            
        })
        
    }
    
    func mailComposeController(controller: MFMailComposeViewController!, didFinishWithResult result: MFMailComposeResult, error: NSError!) {
        switch result.value {
        case MFMailComposeResultCancelled.value:
            NSLog("Mail cancelled")
        case MFMailComposeResultSaved.value:
            NSLog("Mail saved")
        case MFMailComposeResultSent.value:
            NSLog("Mail sent")
        case MFMailComposeResultFailed.value:
            NSLog("Mail sent failure: %@", [error.localizedDescription])
        default:
            break
        }
        self.dismissViewControllerAnimated(true, completion: nil)
        
    }
    
    func messageComposeViewController(controller: MFMessageComposeViewController!, didFinishWithResult result: MessageComposeResult) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    
}
