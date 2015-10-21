//
//  GoodsListTableViewController.swift
//  DailyGoodsManager
//
//  Created by Ryo Morimoto on 2015/07/31.
//  Copyright (c) 2015年 Ryo Morimoto. All rights reserved.
//

import UIKit
import RealmSwift

class GoodsListTableViewController: UITableViewController, UITableViewDataSource,UITableViewDelegate {

    
        
    
    @IBOutlet var goodsListTableView: UITableView!
    var goodsList = Realm().objects(GoodsModel)
    let dateFormatter = NSDateFormatter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dateFormatter.locale = NSLocale(localeIdentifier: "ja_JP")
        dateFormatter.dateFormat = "yyyy/MM/dd"
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
      
    }
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        goodsList = Realm().objects(GoodsModel)
        tableView.reloadData()
    }


    // MARK: - Table view data source

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return goodsList.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as? GoodsListTableViewCell
        cell?.goodsNameLabel.text = (goodsList[indexPath.row] as GoodsModel).name
        cell?.goodsQuantityLabel.text = String((goodsList[indexPath.row] as GoodsModel).quantity)
        
        
        return cell ?? GoodsListTableViewCell()
    }

    @IBAction func swipeCell(sender: UISwipeGestureRecognizer) {
    }
    
    
        

}
