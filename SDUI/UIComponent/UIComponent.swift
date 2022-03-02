//
//  UIComponent.swift
//  SDUI
//
//  Created by Pham Kien on 01.03.22.
//

import Foundation

import SwiftUI
protocol UIDelegate {
    
}

protocol UIComponent {
    var uniqueId:String {get}
    func  render(uiDelegate:UIDelegate) ->AnyView
}


extension View {
    
    func toAny()->AnyView {
        return AnyView(self)
    }
}

func renderPage(ui:[UIComponent],uiDelegate:UIDelegate)->AnyView {
    
    return ScrollView(.vertical) {
        VStack {
            HStack {
                Spacer()
            }
            ForEach(ui,id: \.uniqueId) { uicomponent in
                uicomponent.render(uiDelegate: uiDelegate )
            }.transition(AnyTransition.scale)
            Spacer()
        }
    }.toAny()
}
