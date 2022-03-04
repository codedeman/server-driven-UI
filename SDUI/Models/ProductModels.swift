//
//  ProductModels.swift
//  SDUI
//
//  Created by Pham Kien on 04.03.22.
//

import Foundation


struct ProductModel:Codable {
    var version: String?
    var component:[Component]
}

struct Component:Codable,Hashable {
    var image_url:String?
    var price:String?
    var name:String?
}

struct ActionModel:Codable,Hashable {
    var autoScroll:Int?
}
