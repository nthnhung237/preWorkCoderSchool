//
//  TipCaculatorController.swift
//  TipCalculator
//
//  Created by HỒNG NHUNG on 12/14/16.
//  Copyright © 2016 HỒNG NHUNG. All rights reserved.
//

import UIKit

var bill: Double = 0

var ColorTitle : UIColor = UIColor(red: 0/255, green: 0/255, blue: 100/255, alpha: 0.5)

var BackgroundTitle: UIColor = UIColor(red: 200/255, green: 153/255, blue: 100/255, alpha: 0.5)

var datadefault = UserDefaults.standard

class TipCaculatorController: UIViewController {

    @IBOutlet var lbShow: UILabel!
    
    @IBOutlet var btnDelete: UIButton!
    
    @IBOutlet weak var btnClearAll: UIButton!
    
    @IBOutlet var btSetting: UIBarButtonItem!
    
    @IBOutlet var btnNext: UIButton!
    
    @IBOutlet var btn1 : UIButton!
    
    @IBOutlet var btn2 : UIButton!
    
    @IBOutlet var btn3 : UIButton!
    
    @IBOutlet var btn4 : UIButton!
    
    @IBOutlet var btn5 : UIButton!
    
    @IBOutlet var btn6 : UIButton!
    
    @IBOutlet var btn7 : UIButton!
    
    @IBOutlet var btn8 : UIButton!
    
    @IBOutlet var btn9 : UIButton!
    
    @IBOutlet var btn0 : UIButton!
    
    @IBOutlet var btn : UIButton!
    
    var strNumber : String = ""
    
    var sizenumber : CGFloat!
    
    var strFontNumber : String!
    
    //var ColorTitleNumber : UIColor!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.navigationItem.title = "TIP CALCULATOR";
        self.navigationItem.hidesBackButton = true;
        self.read()
        self.setup()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func read() {
        sizenumber = datadefault.object(forKey: "size") as! CGFloat
        strFontNumber = datadefault.object(forKey: "font") as! String
    }
    
    func setup(){
        btn.titleLabel!.font = UIFont(name: strFontNumber , size: sizenumber)
        btn0.titleLabel!.font = UIFont(name: strFontNumber , size: sizenumber)
        btn1.titleLabel!.font = UIFont(name: strFontNumber , size: sizenumber)
        btn2.titleLabel!.font = UIFont(name: strFontNumber , size: sizenumber)
        btn3.titleLabel!.font = UIFont(name: strFontNumber , size: sizenumber)
        btn4.titleLabel!.font = UIFont(name: strFontNumber , size: sizenumber)
        btn5.titleLabel!.font = UIFont(name: strFontNumber , size: sizenumber)
        btn6.titleLabel!.font = UIFont(name: strFontNumber , size: sizenumber)
        btn7.titleLabel!.font = UIFont(name: strFontNumber , size: sizenumber)
        btn8.titleLabel!.font = UIFont(name: strFontNumber , size: sizenumber)
        btn9.titleLabel!.font = UIFont(name: strFontNumber , size: sizenumber)
        btn.setTitleColor(ColorTitle, for: UIControlState())
        btn0.setTitleColor(ColorTitle, for: UIControlState())
        btn1.setTitleColor(ColorTitle, for: UIControlState())
        btn2.setTitleColor(ColorTitle, for: UIControlState())
        btn3.setTitleColor(ColorTitle, for: UIControlState())
        btn4.setTitleColor(ColorTitle, for: UIControlState())
        btn4.setTitleColor(ColorTitle, for: UIControlState())
        btn5.setTitleColor(ColorTitle, for: UIControlState())
        btn6.setTitleColor(ColorTitle, for: UIControlState())
        btn7.setTitleColor(ColorTitle, for: UIControlState())
        btn8.setTitleColor(ColorTitle, for: UIControlState())
        btn9.setTitleColor(ColorTitle, for: UIControlState())
        btn.backgroundColor = BackgroundTitle
        btn0.backgroundColor = BackgroundTitle
        btn1.backgroundColor = BackgroundTitle
        btn2.backgroundColor = BackgroundTitle
        btn3.backgroundColor = BackgroundTitle
        btn4.backgroundColor = BackgroundTitle
        btn5.backgroundColor = BackgroundTitle
        btn6.backgroundColor = BackgroundTitle
        btn7.backgroundColor = BackgroundTitle
        btn8.backgroundColor = BackgroundTitle
        btn9.backgroundColor = BackgroundTitle
        btnNext.backgroundColor = BackgroundTitle
    }
    
    @IBAction func mainButton(_ sender: UIButton) {
        if (strNumber.characters.count < 8) {
            switch sender.tag {
            case 1:
                strNumber += "1"
                lbShow.text = "$" + strNumber
            case 2:
                strNumber += "2"
                lbShow.text = "$" + strNumber
            case 3:
                strNumber += "3"
                lbShow.text = "$" + strNumber
            case 4:
                strNumber += "4"
                lbShow.text = "$" + strNumber
            case 5:
                strNumber += "5"
                lbShow.text = "$" + strNumber
            case 6:
                strNumber += "6"
                lbShow.text = "$" + strNumber
            case 7:
                strNumber += "7"
                lbShow.text = "$" + strNumber
            case 8:
                strNumber += "8"
                lbShow.text = "$" + strNumber
            case 9:
                strNumber += "9"
                lbShow.text = "$" + strNumber
            case 11:
                strNumber += "0"
                lbShow.text = "$" + strNumber
            default:
                strNumber += "."
                lbShow.text = "$" + strNumber
        }
        }
        
    }
    
    @IBAction func nextButton(_ sender: UIButton) {

        if strNumber.isEmpty == true {
            let createAccountErrorAlert: UIAlertView = UIAlertView()
            createAccountErrorAlert.delegate = self
            createAccountErrorAlert.title = ""
            createAccountErrorAlert.message = "Could not number!"
            createAccountErrorAlert.addButton(withTitle: "OK")
            createAccountErrorAlert.show()
        } else {
            bill = Double (strNumber)!
            let BillAmountView = self.storyboard?.instantiateViewController(withIdentifier: "BillAmountID") as! BillAmountController
            self.navigationController?.pushViewController(BillAmountView, animated: true)
        }
    }
    
    @IBAction func deleteButton(_ sender: UIButton) {
        
        if(strNumber .isEmpty != true) {
            let truncated = strNumber.substring(to: strNumber.characters.index(before: strNumber.endIndex))
            strNumber = truncated
            lbShow.text = "$" + strNumber
        } else
        {
            lbShow.text = "$"
        }
    }
    
    @IBAction func clearButton(_ sender: Any) {
        strNumber = ""
        lbShow.text = "$"
    }
    
    @IBAction func settingButton(_ sender: AnyObject) {
        
        let SettingView = self.storyboard?.instantiateViewController(withIdentifier: "Setting") as! SettingController
        self.navigationController?.pushViewController(SettingView, animated: true)
    }
    


}

