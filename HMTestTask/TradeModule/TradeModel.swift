//
//  TradeModel.swift
//  HMTestTask
//
//  Created by Nickolay Vasilchenko on 23.05.2021.
//

import Foundation

struct RequestData {
    let balance: Int
    let time: Int?
    let investment: Int?
    let HTMLContent: String?
    let url: URL?
}

struct ResponseData {
    let balance: Int
    let time: Int?
    let investment: Int?
    let HTMLContent: String?
    let url: URL?
}

struct ViewModelData {
    let balance: String
    let time: String
    let investment: String
    let HTMLContent: String?
    let url: URL? 
}
