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
        dateFormatter.dateFormat = "yyyy/MM/dd HH:mm"
        
//        goodsListTableView.delegate = self
//        goodsListTableView.dataSource = self
        
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
        let cell = tableView.dequeueReusableCellWithIdentifier("GoodsListCell", forIndexPath: indexPath) as? GoodsListTableViewCell
        cell?.goodsNameLabel.text = (goodsList[indexPath.row] as GoodsModel).name
        cell?.lastAddDateLabel.text = dateFormatter.stringFromDate((goodsList[indexPath.row] as GoodsModel).lastAddDate)
        cell?.nextNoticeDateLabel.text = dateFormatter.stringFromDate((goodsList[indexPath.row] as GoodsModel).nextNoticeDate)
        
        
        return cell ?? UITableViewCell()
    }

        

}
