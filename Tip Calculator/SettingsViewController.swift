//
//  SettingsViewController.swift
//  Tip Calculator
//
//  Created by Cory Avra on 12/10/15.
//  Copyright © 2015 coryavra. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController,UIPickerViewDataSource,UIPickerViewDelegate {
    
    @IBOutlet weak var defaultTipControl: UISegmentedControl!
    @IBOutlet weak var colorPicker: UIPickerView!
    
    var pickerData: [String] = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //connect the data
        colorPicker.delegate = self
        colorPicker.dataSource = self
        
        //fill the array
        pickerData = ["Day", "Night", "Red", "Green", "Blue", "Yellow"]
        
    }

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)

        //set the segment control to the default index, if it exists
        let defaults = NSUserDefaults.standardUserDefaults()
        if (defaults.objectForKey("default_tip") != nil) {
            let defaultSegIndex = defaults.integerForKey("default_tip")
            defaultTipControl.selectedSegmentIndex = defaultSegIndex
        }
        if (defaults.objectForKey("default_color") != nil) {
            let newColor = defaults.objectForKey("default_color") as! String
            changeColorTheme(newColor)
        }
        if (defaults.objectForKey("default_row") != nil) {
            let defaultRow = defaults.integerForKey("default_row")
            colorPicker.selectRow(defaultRow, inComponent: 0, animated: false)
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func onDefaultChanged(sender: AnyObject) {
        
        let defaults = NSUserDefaults.standardUserDefaults()
        defaults.setInteger(defaultTipControl.selectedSegmentIndex, forKey: "default_tip")
        defaults.synchronize()
    }
    
    func changeColorTheme(newColor: String) {
        let defaults = NSUserDefaults.standardUserDefaults()
        defaults.setObject(newColor, forKey: "default_color")
        defaults.synchronize()
        
        //change background and tint colors
        if (newColor == "Day") {
            self.view.backgroundColor = UIColor.whiteColor()
            self.view.tintColor = UIColor.blueColor()
            defaults.setObject(0, forKey: "default_row")
        }
        else if (newColor == "Night") {
            self.view.backgroundColor = UIColor.grayColor()
            self.view.tintColor = UIColor.blackColor()
            defaults.setObject(1, forKey: "default_row")
        }
        else if (newColor == "Red") {
            self.view.backgroundColor = UIColor(red: 1, green: 0.6, blue: 0.4, alpha: 1)
            self.view.tintColor = UIColor.blackColor()
            defaults.setObject(2, forKey: "default_row")
        }
        else if (newColor == "Green") {
            self.view.backgroundColor = UIColor(red: 0.61, green: 1, blue: 0.46, alpha: 1)
            self.view.tintColor = UIColor.blackColor()
            defaults.setObject(3, forKey: "default_row")
        }
        else if (newColor == "Blue") {
            self.view.backgroundColor = UIColor(red: 0, green: 1, blue: 1, alpha: 1)
            self.view.tintColor = UIColor.blueColor()
            defaults.setObject(4, forKey: "default_row")
        }
        else if (newColor == "Yellow") {
            self.view.backgroundColor = UIColor(red: 1, green: 1, blue: 0.4, alpha: 1)
            self.view.tintColor = UIColor.blackColor()
            defaults.setObject(5, forKey: "default_row")
        }
        else {
            changeColorTheme("Day")
        }
    }
    
    //MARK: - Delegates and data sources for colorPicker
    //data sources
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }
    
    //delegates
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerData[row]
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        changeColorTheme(pickerData[row])
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
