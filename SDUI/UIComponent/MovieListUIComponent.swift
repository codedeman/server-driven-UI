//
//  MovieListComponent.swift
//  SDUI
//
//  Created by Pham Kien on 02.03.22.
//

import SwiftUI
import Kingfisher
import Foundation

class MovieListUIComponent:UIComponent {
    var uniqueId: String
    let movieResult: MoviesResult

    init(movieResult:MoviesResult){
        self.movieResult = movieResult
        self.uniqueId = movieResult.title ?? "Movies"
    }
    
    func render(uiDelegate: UIDelegate) -> AnyView {
        return MovieListView(movieResult: movieResult).toAny()
    }
    
    
}

struct MovieListView:View {
    
    let movieResult: MoviesResult
    
    var body: some View {
        VStack {
            HStack {
                Text(movieResult.title ?? "Movie").font(.headline)
            }
        }
        ScrollView(.horizontal,showsIndicators: false) {
            HStack {
                ForEach(movieResult.results,id: \.title) { movie in
                    MovieView(movie: movie)
                    
                }

            }
        }
    }
}


struct MovieView:View{
    let movie:Movie
    
    var body: some View {
        VStack {
            KFImage(URL(string: "https://image.tmdb.org/t/p/w300/\(movie.poster_path)")).resizable().frame(width: 200, height: 300).cornerRadius(10)
            Text(movie.title).frame(width: 180, alignment: .center).foregroundColor(.black)
        }
    }
    
}

//struct MovieListComponent: View {
//    var body: some View {
//        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
//    }
//}
//
//struct MovieListComponent_Previews: PreviewProvider {
//    static var previews: some View {
//        MovieListComponent()
//    }
//}
