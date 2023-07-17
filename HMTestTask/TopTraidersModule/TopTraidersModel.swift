//
//  TraidersModel.swift
//  HMTestTask
//
//  Created by Nickolay Vasilchenko on 20.05.2021.
//

import Foundation

struct RequestModel {
    var flag: String?
    var name: String
    var deposit: Int
}

struct ResponseModel {
    var flag: String?
    var name: String
    var deposit: Int
    var profit: Int
}

struct ViewModel {
    var flag: String?
    var name: String
    var deposit: String
    var profit: String
}
