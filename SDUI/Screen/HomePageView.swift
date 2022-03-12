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
        renderPage(ui: controller.uiComponents, uiDelegate: self).background(SwiftUI.Color.white.edgesIgnoringSafeArea(.all)).onAppear {
            self.controller.loadPage()
            
        }.background(SwiftUI.Color.white.edgesIgnoringSafeArea(.all))
        
    }
}

struct HomePageView_Previews: PreviewProvider {
    static var previews: some View {
        HomePageView(controller: HomePageController())
    }
}
