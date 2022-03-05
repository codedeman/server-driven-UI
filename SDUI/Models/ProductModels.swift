//
//  ProductModels.swift
//  SDUI
//
//  Created by Pham Kien on 04.03.22.
//

import Foundation


struct ProductModel:Codable {
    var version: String?
    var component:[ProductComponent]
}

struct ProductComponent:Codable {
    var type:String?
    var action:ActionModel?
    var data:[ProductItemModel]
}

struct ProductItemModel:Codable,Hashable {
    var image_url:String?
    var price:String?
    var name:String?
    var id:String?
}

struct ActionModel:Codable,Hashable {
    var autoScroll:Int?
}


//"type":"NewProduct",
//"action":{"auto_scroll":1},
//"data":[
//    {
//        "id":"134"
//        "image_url":"https://doanhnhanplus.vn/wp-content/uploads/2021/12/Hyundai-Santa-Fe-2022-phien-ban-6-cho-20211213-dnplus-01.jpg"
//        "name":"SantaFe"
//        "price":"100000"
//    },
