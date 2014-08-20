//
//  ViewController.swift
//  NgoaiTe
//
//  Created by user123 on 04/08/2014.
//  Copyright (c) Năm 2014 Tam. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var inputNumber: UILabel!
    @IBOutlet var answerNumber: UILabel!
    @IBOutlet var labelStatus: UILabel!
    
    // true: convert VND -> YEN, false: convert YEN -> VND
    var change: Bool = true;
    
    // 1YEN = 207.98 VND
    let exchange: Int = 208
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func buttonTapped(theButton: UIButton){
        if(inputNumber.text == "0"){
                inputNumber.text = theButton.titleLabel.text
        }else{
            inputNumber.text = inputNumber.text + theButton.titleLabel.text
        }
    }
    
    @IBAction func changeTapped(theButton: UIButton){
        change = !change
        if(change == true){
            labelStatus.text = "VND -> YEN"
        }else{
            labelStatus.text = "YEN -> VND"
        }
        let newString = answerNumber.text.stringByReplacingOccurrencesOfString(",", withString: "", options: NSStringCompareOptions.LiteralSearch, range: nil)
        inputNumber.text = newString
        pressEnter(theButton)
    }
    
    @IBAction func pressEnter(UIButton){
        var equal: Int = 0
        if(change == true){
            equal = inputNumber.text.toInt()! / exchange
        }else{
            equal = inputNumber.text.toInt()! * exchange
        }
        
        var numberFormatter: NSNumberFormatter = NSNumberFormatter()
        numberFormatter.numberStyle = NSNumberFormatterStyle.DecimalStyle
        numberFormatter.formatterBehavior = NSNumberFormatterBehavior.BehaviorDefault
    
        answerNumber.text = numberFormatter.stringFromNumber(equal)
    }
    
    @IBAction func clearNumber(UIButton){
        inputNumber.text = "0"
        answerNumber.text = "0"
    }

}

