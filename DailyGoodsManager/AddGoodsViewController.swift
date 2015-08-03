//
//  AddGoodsViewController.swift
//  DailyGoodsManager
//
//  Created by Ryo Morimoto on 2015/07/31.
//  Copyright (c) 2015年 Ryo Morimoto. All rights reserved.
//

import UIKit
import RealmSwift

class AddGoodsViewController: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var lastAddDateTextField: UITextField!
    @IBOutlet weak var nextNoticeDateTextField: UITextField!
    let dateFormatter = NSDateFormatter()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let AddDatePicker = UIDatePicker()
        let NoticeDatePicker = UIDatePicker()
        //dateFomatterの設定
        dateFormatter.locale = NSLocale(localeIdentifier: "ja_JP")
        dateFormatter.dateFormat = "yyyy/MM/dd HH:mm"
        //datepickerの表示
        AddDatePicker.datePickerMode = .DateAndTime
        AddDatePicker.addTarget(self, action: Selector("updateLastAddDateTextField:"),  forControlEvents: .ValueChanged)
        lastAddDateTextField.inputView = AddDatePicker
        NoticeDatePicker.datePickerMode = .DateAndTime
        NoticeDatePicker.addTarget(self, action: Selector("updateNextNoticeDateTextField:"),  forControlEvents: .ValueChanged)
        nextNoticeDateTextField.inputView = NoticeDatePicker
}
    func updateLastAddDateTextField(sender: UIDatePicker){
        lastAddDateTextField.text = dateFormatter.stringFromDate(sender.date)
    }
    
    func updateNextNoticeDateTextField(sender: UIDatePicker){
        nextNoticeDateTextField.text = dateFormatter.stringFromDate(sender.date)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func addButtonTouchUpInside(sender: AnyObject) {
        let goods = GoodsModel()
        goods.name = nameTextField.text 
        goods.lastAddDate = dateFormatter.dateFromString(lastAddDateTextField.text) ?? NSDate()
        goods.nextNoticeDate = dateFormatter.dateFromString(nextNoticeDateTextField.text) ?? NSDate()
        let realm = Realm()
        realm.write {
            realm.add(goods, update: false)
            }
        self.dismissViewControllerAnimated(true, completion: nil)
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
