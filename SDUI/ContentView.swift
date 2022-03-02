//
//  ContentView.swift
//  SDUI
//
//  Created by Pham Kien on 22.02.22.
//

import SwiftUI

struct Restaurant:Identifiable {
    let id = UUID()
    let name:String
    let description:String
    let imageUrl:String
}

struct RestaurantRow:View {
    var restaurant:Restaurant
    var body: some View {
        HStack(alignment: .top, spacing: 0) {
            Image(restaurant.imageUrl, bundle: nil).resizable().aspectRatio(contentMode: .fit)
            VStack(alignment: .leading, spacing: 5) {
                Text(restaurant.name)
                Text(restaurant.description)
            }
        }
        Spacer()

       

    }
}
//private class BooksViewModel:ObservedObject {
//    @Published var books: [Book] = Book.samples
//}
struct ContentView: View {
    
    let restaurants = [
        Restaurant(name: "Joe's Original", description: "Kevin", imageUrl: "clothes"),
        Restaurant(name: "The Real Joe's Original",description: "Peter", imageUrl: "clothes"),
        Restaurant(name: "Original Joe's",description: "Bad", imageUrl: "clothes"),
        Restaurant(name: "Original Joe's",description: "Bad", imageUrl: "clothes"),

        Restaurant(name: "Original Joe's",description: "Bad", imageUrl: "clothes"),

        Restaurant(name: "Original Joe's",description: "Bad", imageUrl: "clothes"),
        Restaurant(name: "Original Joe's",description: "Bad", imageUrl: "clothes"),
        Restaurant(name: "Original Joe's",description: "Bad", imageUrl: "clothes"),
        Restaurant(name: "Original Joe's",description: "Bad", imageUrl: "clothes")

        ]
    var body: some View {
        List( restaurants) { restaurant in
            RestaurantRow(restaurant: restaurant)
        }
//        Text("Hello, world!")
//            .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
