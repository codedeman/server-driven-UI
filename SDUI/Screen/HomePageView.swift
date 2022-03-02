//
//  HomePageView.swift
//  SDUI
//
//  Created by Pham Kien on 02.03.22.
//

import SwiftUI

struct HomePageView: View,UIDelegate{
    @ObservedObject
    var controller:HomePageController
    
    var body: some View {
        renderPage(ui: , uiDelegate: <#T##UIDelegate#>)
//        Text("Hello, World!")
    }
}

struct HomePageView_Previews: PreviewProvider {
    static var previews: some View {
        HomePageView()
    }
}
