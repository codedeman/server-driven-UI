//
//  SDUIApp.swift
//  SDUI
//
//  Created by Pham Kien on 22.02.22.
//

import SwiftUI
import Alamofire

@main
struct SDUIApp: App {
    var window: UIWindow?

    var body: some Scene {
        WindowGroup {
            BreweriesView()
//            HomePageView(controller: HomePageController())
            
        }
    }
}
