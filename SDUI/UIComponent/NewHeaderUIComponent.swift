//
//  NewHeaderUIComponent.swift
//  SDUI
//
//  Created by Pham Kien on 04.03.22.
//

import Foundation
import Kingfisher
import SwiftUI

class NewHeaderUIComponent:UIComponent {
   
    
    var uniqueId: String
    var product:[ProductComponent]
    
    init(product:ProductModel) {
        self.uniqueId = product.version ?? "Fuck"
        self.product = product.components.filter {$0.type == "NewProduct"}
//        product.
    }
    

    func render(uiDelegate: UIDelegate) -> AnyView {
        return NewHeaderView(component: product).toAny()
    }

    
}

struct NewHeaderView:View {
    
    let component:[ProductComponent]
    var body: some View {
//        NavigationView{
        VStack {
            Text("Kha banh")
            Text("oi ban oi")
        }
        ScrollView(.horizontal,showsIndicators: false) {
            HStack {
                if let data =  component.first?.data {
                    ForEach(data, id: \.id) { product    in
                        NewFeedItem(item: product)
                    }
                }
                
            }
            
        }
                

    }
}

struct NewFeedItem:View {
    let item:ProductItemModel
    var body:some View {
        VStack {
            KFImage(URL(string: item.image_url ?? "")).resizable()
            Text(item.name ?? "").frame(width: 180, alignment: .center).foregroundColor(.black)
        }
    }
}
