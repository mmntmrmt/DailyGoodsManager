//
//  GoodsDetailsViewController.swift
//  DailyGoodsManager
//
//  Created by Ryo Morimoto on 2015/10/14.
//  Copyright (c) 2015年 Ryo Morimoto. All rights reserved.
//

import UIKit

class GoodsDetailsViewController: UIViewController {
    
    
    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var lastAddDateTextField: UITextField!
        let dateFormatter = NSDateFormatter()
    
    @IBOutlet weak var nextNoticeDateTextField: UITextField!
        override func viewDidLoad() {
        super.viewDidLoad()
        let addDatePicker = UIDatePicker()
        let noticeDatePicker = UIDatePicker()
        //dateFomatterの設定
        dateFormatter.locale = NSLocale(localeIdentifier: "ja_JP")
        dateFormatter.dateFormat = "yyyy/MM/dd"
        //datepickerの表示
        addDatePicker.datePickerMode = .Date
        addDatePicker.addTarget(self, action: Selector("updateLastAddDateTextField:"),  forControlEvents: .ValueChanged)
        lastAddDateTextField.inputView = addDatePicker
        noticeDatePicker.datePickerMode = .Date
        noticeDatePicker.addTarget(self, action: Selector("updateNextNoticeDateTextField:"),  forControlEvents: .ValueChanged)
        nextNoticeDateTextField.inputView = noticeDatePicker

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func tapScreen(sender: UITapGestureRecognizer) {
        self.view.endEditing(true)
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
