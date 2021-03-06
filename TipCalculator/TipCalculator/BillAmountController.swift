//
//  BillAmountController.swift
//  TipCalculator
//
//  Created by HỒNG NHUNG on 1/3/17.
//  Copyright © 2017 HỒNG NHUNG. All rights reserved.
//

import UIKit

class BillAmountController: UIViewController {
    
    @IBOutlet var lbBill: UILabel!
    
    @IBOutlet var lbTiprate: UILabel!
    
    @IBOutlet var sldTiprate: UISlider!
    
    @IBOutlet var lbTip: UILabel!
    
    @IBOutlet var lbTotal: UILabel!
    
    var tiprate : Int = 50
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tiprate = datadefault.object(forKey: "tip") as! Int
        sldTiprate.minimumValue = 0
        sldTiprate.maximumValue = 100
        sldTiprate.isContinuous = true
        sldTiprate.value = Float (tiprate)
        lbBill.text = String(format: "$%.2f", bill)
        lbTiprate.text = "\(tiprate)" + "%"
        let Tip = bill * Double(tiprate)/100
        lbTip.text = String(format: "$%.2f", Tip)
        let total = bill + Tip
        lbTotal.text = String(format: "$%.2f", total)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        datadefault.set(tiprate, forKey: "tip")
    }
    
    @IBAction func sliderValueChanged(_ sender: UISlider){
        sldTiprate.isUserInteractionEnabled = true
        tiprate = Int(sldTiprate.value)
        lbTiprate.text = "\(tiprate)" + "%"
        let Tip = bill * Double(tiprate)/100
        lbTip.text = String(format: "$%.2f", Tip)
        let total = bill + Tip
        lbTotal.text = String(format: "$%.2f", total)
    }
    
}
