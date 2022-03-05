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
    var component:ProductModel
    
    init(component:ProductModel) {
        self.uniqueId = "Nothing"
        self.component = component
    }
    
    func getProductComponent() -> [ProductComponent] {
        let arrComp = component.component.filter {$0.type  == "NewProduct"}

        return arrComp
    }
//    
    func render(uiDelegate: UIDelegate) -> AnyView {
        let arrComp:[ProductComponent] = component.component.filter {$0.type  == "NewProduct"}

        return NewHeaderView(component: arrComp).toAny()
    }
//    init(tvShowResult:TvShowsResult) {
//        self.uniqueId = tvShowResult.title ?? "Shows"
//        self.tvShowResult = tvShowResult
//    }
//    return TVShowView(tvShowResult: tvShowResult).toAny()

//    func render(uiDelegate: UIDelegate) -> AnyView {
//        return NewHeaderView(
//    }
    
    
}

struct NewHeaderView:View {
    
    let component:ProductComponent
    var body: some View {
        NavigationView{
            HStack {
                ScrollView(.horizontal) {
                    ForEach(component.data, id: \.id) { product    in
                        NewFeedItem(item: product)
                    }
                }
                
            }

        }.navigationBarTitle("New Product")
    }
}

struct NewFeedItem:View {
    let item:ProductItemModel
    var body:some View {
        VStack {
            KFImage(URL(string: item.image_url ?? "")).resizable()
            Text(item.name ?? "")
        }
    }
}
