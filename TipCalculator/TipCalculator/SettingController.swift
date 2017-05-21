//
//  SettingController.swift
//  TipCalculator
//
//  Created by HỒNG NHUNG on 1/3/17.
//  Copyright © 2017 HỒNG NHUNG. All rights reserved.
//

import UIKit


class SettingController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    @IBOutlet var lbTipRate: UILabel!
    
    @IBOutlet var Tiprate: UISlider!
    
    @IBOutlet var setFont: UIPickerView!
    
    @IBOutlet var lbSize: UILabel!
    
    var arrNameFont : NSMutableArray = []
    
    @IBOutlet var sgColor: UISegmentedControl!
    
    @IBOutlet var btnOk: UIButton!
    
    var tip : TipCaculatorController = TipCaculatorController()
    
    @IBOutlet var setSize: UIStepper!
    
    @IBOutlet var btblack: UIButton!
    
    @IBOutlet var btblue: UIButton!
    
    @IBOutlet var btbrown: UIButton!
    
    @IBOutlet var btcyan: UIButton!
    
    @IBOutlet var btgreen: UIButton!
    
    @IBOutlet var btmagenta: UIButton!
    
    @IBOutlet var btorange: UIButton!
    
    @IBOutlet var btpurple: UIButton!
    
    @IBOutlet var btwhite: UIButton!
    
    @IBOutlet var btyellow: UIButton!
    
    @IBOutlet var btred: UIButton!
    
    @IBOutlet var btnickel: UIButton!
    
    @IBOutlet var btteal: UIButton!
    
    @IBOutlet var btmidnight: UIButton!
    
    @IBOutlet var btsky: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // tip rate
        Tiprate.minimumValue = 0
        Tiprate.maximumValue = 100
        Tiprate.value = Float (tiprate)
        lbTipRate.text = "\(tiprate)" + "%"
        // set font
        self.setFont.dataSource = self
        self.setFont.delegate = self
        for str: String in UIFont.familyNames {
            arrNameFont.add(str)
        }
        //set size
        setSize.wraps = true
        setSize.autorepeat = true
        setSize.maximumValue = 50
        setSize.value = Double(fontSize)
        lbSize.text = "\(size)"
        //set button cancel && ok
        btnOk.layer.cornerRadius = 7
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func sldTipRate(_ sender: AnyObject) {
        Tiprate.isContinuous = true
        Tiprate.isUserInteractionEnabled = true
        tiprate = Int(Tiprate.value)
        lbTipRate.text = "\(tiprate)" + "%"
        
    }
    
    //set Fort
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return arrNameFont.count;
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return arrNameFont[row] as! String
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int)
    {
        arrNameFont[row] = strNameFont
        strNameFont = arrNameFont[row] as! String

    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        lbSize.text = Int(sender.value).description
        fontSize = CGFloat(sender.value)
    }
    
    
    @IBAction func setColor(_ sender:UISegmentedControl)
    {
        switch sgColor.selectedSegmentIndex
        {
            case 0:
                print ("0 Segment selected")
                //self .colorButton(<#T##sender: UIButton##UIButton#>)
            case 1:
                print ("1 Segment selected")

            default:
                break;
        }
    }
    
    
     @IBAction func colorButton(_ sender: UIButton) {
        print(sender.tag)
        if (sgColor.selectedSegmentIndex == 0)
        {
            switch sender.tag {
            case 1:
                ColorTitle = UIColor.black
            case 2:
                ColorTitle = UIColor.blue
            case 3:
                ColorTitle = UIColor.brown
            case 4:
                ColorTitle = UIColor.cyan
            case 5:
                ColorTitle = UIColor.green
            case 6:
                ColorTitle = UIColor.magenta
            case 7:
                ColorTitle = UIColor.orange
            case 8:
                ColorTitle = UIColor.purple
            case 9:
                ColorTitle = UIColor.white
            case 11:
                ColorTitle = UIColor.yellow
            case 12:
                ColorTitle = UIColor.red
            case 13:
                ColorTitle = UIColor.darkGray
            case 14:
                ColorTitle = UIColor.lightGray
            default:
                ColorTitle = UIColor.clear
            }
        } else {
            switch sender.tag {
            case 1:
                BackgroundTitle = UIColor.black
            case 2:
                BackgroundTitle = UIColor.blue
            case 3:
                BackgroundTitle = UIColor.brown
            case 4:
                BackgroundTitle = UIColor.cyan
            case 5:
                BackgroundTitle = UIColor.green
            case 6:
                BackgroundTitle = UIColor.magenta
            case 7:
                BackgroundTitle = UIColor.orange
            case 8:
                BackgroundTitle = UIColor.purple
            case 9:
                BackgroundTitle = UIColor.white
            case 11:
                BackgroundTitle = UIColor.yellow
            case 12:
                BackgroundTitle = UIColor.red
            case 13:
                BackgroundTitle = UIColor.darkGray
            case 14:
                BackgroundTitle = UIColor.lightGray
            default:
                BackgroundTitle = UIColor.clear
            }

        }
        sender.isSelected = !sender.isSelected;
        print("aaaaaaa")
    }
    
    
    @IBAction func btnOk(_ sender: AnyObject) {

        let TipViewControllerObj = self.storyboard?.instantiateViewController(withIdentifier: "TipCaculator") as? TipCaculatorController
        self.navigationController?.pushViewController(TipViewControllerObj!, animated: true)
        
    }
    
}
