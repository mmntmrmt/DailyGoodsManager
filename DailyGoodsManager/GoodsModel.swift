//
//  GoodsModel.swift
//  DailyGoodsManager
//
//  Created by Ryo Morimoto on 2015/07/31.
//  Copyright (c) 2015年 Ryo Morimoto. All rights reserved.
//

import RealmSwift

class GoodsModel: Object {
    
    dynamic var name = ""
    
    dynamic var lastAddDate = NSDate()
    dynamic var nextNoticeDate = NSDate()
    
// Specify properties to ignore (Realm won't persist these)
    
//  override static func ignoredProperties() -> [String] {
//    return []
//  }
}
