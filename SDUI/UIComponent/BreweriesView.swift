////
////  BreweriesView.swift
////  SDUI
////
////  Created by Pham Kien on 08.03.22.
////
//
//import SwiftUI
//import MapKit
//
//struct BreweriesView: View {
//    @ObservedObject var viewModel = BreweriesViewModel()
//
//    let breweries = [Brewery]()
//    
////    init (breweries:BreweriesView) {
////        self.breweries
////    }
//    var body: some View {
//        NavigationView {
//            
////            List(viewModel.breweries,id:\.self) { objec in
////                BreweriesItem(brewery: objec)
////            }
////            ScrollView(.horizontal,showsIndicators: false) {
////                HStack {
////                    ScrollView(.vertical,showsIndicators: false) {
////                        VStack {
////                            ForEach(viewModel.breweries,id:\.name)  { object in
////                                BreweriesItem(brewery: object)
////                            }
////                        }
////                    }
////                }
////
////            }
//
//        }.navigationTitle("What the fuck").onAppear {
//            viewModel.fetchBrewries()
//        }
//    }
//}
//
//struct BreweriesItem:View {
//    
//    private let brewery:Brewery
//    init(brewery:Brewery) {
//        self.brewery = brewery
//    }
//    
//    var body: some View {
//        HStack {
//            Image(uiImage: UIImage(named: "beer")!)
//                           .resizable()
//                           .scaledToFit()
//                           .frame(width: 80, height: 80)
//                       VStack(alignment: .leading, spacing: 15) {
//                           Text(brewery.name)
//                               .font(.system(size: 18))
//                               .foregroundColor(Color.blue)
//                           Text("\(brewery.city) - \(brewery.street)")
//                               .font(.system(size: 14))
//                       }        }
//    }
//}
//
//
//struct BreweriesView_Previews: PreviewProvider {
//    static var previews: some View {
//        BreweriesView()
//    }
//}
