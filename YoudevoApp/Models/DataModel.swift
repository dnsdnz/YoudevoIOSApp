//
//  DataModel.swift
//  YoudevoApp
//
//  Created by Deniz MacBook Air on 20.08.2020.
//  Copyright © 2020 Deniz Cakmak. All rights reserved.
//

import Foundation

struct jsonstruct:Decodable {
    
    let news_id:Int
    let title:String
    let content:String
    let category:String
    let pic_name:String
    
}
