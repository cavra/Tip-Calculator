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
    @IBOutlet weak var totalTwoLabel: UILabel!
    @IBOutlet weak var totalThreeLabel: UILabel!
    @IBOutlet weak var totalFourLabel: UILabel!
    @IBOutlet weak var totalFiveLabel: UILabel!
    
    @IBOutlet weak var tipControl: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //default the text labels to $0.00
        tipLabel.text = "$0.00"
        totalLabel.text = "$0.00"
        totalTwoLabel.text = "$0.00"
        totalThreeLabel.text = "$0.00"
        totalFourLabel.text = "$0.00"
        totalFiveLabel.text = "$0.00"
        
        //raise the decimal pad as soon as it opens
        billField.becomeFirstResponder()
        
        //write the placeholder text
        let formatter = NSNumberFormatter()
        formatter.numberStyle = .CurrencyStyle
        billField.attributedPlaceholder = NSAttributedString(string: formatter.stringFromNumber(0)!)
        
        //remember the bill from a recent* previous session (60*10 = 10 minutes)
        let defaults = NSUserDefaults.standardUserDefaults()
        if (defaults.objectForKey("default_bill") != nil) {
            let then = defaults.objectForKey("time_at_close")!
            if (NSDate().timeIntervalSinceReferenceDate - then.timeIntervalSinceReferenceDate < 60*10) {
                billField.text = defaults.objectForKey("default_bill") as! String!
            }
        }
    }

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        //set the defaultTipIndex to 0, in case the actual default doesn't exist
        var defaultTipIndex = 0
        
        //get the user-defined defaults 
        let defaults = NSUserDefaults.standardUserDefaults()
        if (defaults.objectForKey("default_tip") != nil) {
            defaultTipIndex = defaults.integerForKey("default_tip")
        }
        if (defaults.objectForKey("default_color") != nil) {
            let newColor = defaults.objectForKey("default_color") as! String
            changeColorTheme(newColor)
        }
        else {
            changeColorTheme("Day")
        }
   
        //set the segment control to reflect the defaulted value
        tipControl.selectedSegmentIndex = defaultTipIndex
        
        updateBill(defaultTipIndex)
        
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        //record the text in the bill field and the current time
        let defaults = NSUserDefaults.standardUserDefaults()

        defaults.setObject(billField.text, forKey: "default_bill")
        defaults.setObject(NSDate(), forKey: "time_at_close")

        defaults.synchronize()
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
        let tipPercentages = [0.15, 0.2, 0.25]
        let tipPercentage = tipPercentages[tipPercentageIndex]
        let billAmount = NSString(string: billField.text!).doubleValue
        
        //calculate the tip and total
        let tip = billAmount * tipPercentage
        let total = billAmount + tip
        let totalForTwo = total / 2
        let totalForThree = total / 3
        let totalForFour = total / 4
        let totalForFive = total / 5
        
        //set and format text labels using locale data
        let formatter = NSNumberFormatter()
        formatter.numberStyle = .CurrencyStyle

        tipLabel.text = formatter.stringFromNumber(tip)
        totalLabel.text = formatter.stringFromNumber(total)
        totalTwoLabel.text = formatter.stringFromNumber(totalForTwo)
        totalThreeLabel.text = formatter.stringFromNumber(totalForThree)
        totalFourLabel.text = formatter.stringFromNumber(totalForFour)
        totalFiveLabel.text = formatter.stringFromNumber(totalForFive)
        
    }
    
    //@todo
    //having this function in here AND in
    //settingsViewController is bad implementation
    func changeColorTheme(newColor: String) {
        let defaults = NSUserDefaults.standardUserDefaults()
        defaults.setObject(newColor, forKey: "default_color")
        defaults.synchronize()
        
        //change background and tint colors
        if (newColor == "Day") {
            self.view.backgroundColor = UIColor.whiteColor()
            self.view.tintColor = UIColor.blueColor()
        }
        else if (newColor == "Night") {
            self.view.backgroundColor = UIColor.grayColor()
            self.view.tintColor = UIColor.blackColor()
        }
        else if (newColor == "Red") {
            self.view.backgroundColor = UIColor(red: 1, green: 0.6, blue: 0.4, alpha: 1)
            self.view.tintColor = UIColor.blackColor()
        }
        else if (newColor == "Green") {
            self.view.backgroundColor = UIColor(red: 0.61, green: 1, blue: 0.46, alpha: 1)
            self.view.tintColor = UIColor.blackColor()
        }
        else if (newColor == "Blue") {
            self.view.backgroundColor = UIColor(red: 0, green: 1, blue: 1, alpha: 1)
            self.view.tintColor = UIColor.blueColor()
        }
        else if (newColor == "Yellow") {
            self.view.backgroundColor = UIColor(red: 1, green: 1, blue: 0.4, alpha: 1)
            self.view.tintColor = UIColor.blackColor()
        }
        else {
            changeColorTheme("Day")
        }
    }
}

