//
//  ViewController.swift
//  Tip Calculator
//
//  Created by Cory Avra on 12/10/15.
//  Copyright © 2015 coryavra. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //default the text labels to $0.00
        tipLabel.text = "$0.00"
        totalLabel.text = "$0.00"
        
    }

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        //set the defaultTipIndex to 0, in case the actual default doesn't exist
        var defaultTipIndex = 0
        
        //get the user-defined default from the settings viewController
        let defaults = NSUserDefaults.standardUserDefaults()
        if (defaults.objectForKey("default_tip") != nil) {
            defaultTipIndex = defaults.integerForKey("default_tip")
        }
   
        //set the segment control to reflect the defaulted value
        tipControl.selectedSegmentIndex = defaultTipIndex
        
        updateBill(defaultTipIndex)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onEditingChanged(sender: AnyObject) {
        updateBill(tipControl.selectedSegmentIndex)
    }

    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }
    
    func updateBill(tipPercentageIndex: Int) {
        //access any stored data
        let defaults = NSUserDefaults.standardUserDefaults()
        
        let tipPercentages = [0.15, 0.2, 0.25]
        let tipPercentage = tipPercentages[tipPercentageIndex]
        let billAmount = NSString(string: billField.text!).doubleValue
        
        //calculate the tip
        let tip = billAmount * tipPercentage
        let total = billAmount + tip
        
        //set and format text labels
        tipLabel.text = "$\(tip)"
        totalLabel.text = "$\(total)"
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
    
        //synchronize the data
        defaults.synchronize()
    }
    
}

