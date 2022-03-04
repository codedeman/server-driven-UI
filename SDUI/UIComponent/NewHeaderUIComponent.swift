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
    var component:ProductModel?
    
    init(component:ProductModel) {
        self.uniqueId = "Nothing"
        self.component = component
    }
//    init(tvShowResult:TvShowsResult) {
//        self.uniqueId = tvShowResult.title ?? "Shows"
//        self.tvShowResult = tvShowResult
//    }
//    return TVShowView(tvShowResult: tvShowResult).toAny()

    func render(uiDelegate: UIDelegate) -> AnyView {
        return NewHeaderView(product: component).toAny()
    }
    
    
}

struct NewHeaderView:View {
    
    let product:Component?
    
    var body: some View {
        NavigationView{
            List(){
                
            }
        }.navigationBarTitle("New Product")
    }
}
