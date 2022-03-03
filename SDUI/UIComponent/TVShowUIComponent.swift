//
//  TVShowUIComponent.swift
//  SDUI
//
//  Created by Pham Kien on 03.03.22.
//

import Foundation
import SwiftUI
import Kingfisher


class TVShowUIComponent:UIComponent {
    var uniqueId: String
    var tvShowResult:TvShowsResult
    
    init(tvShowResult:TvShowsResult) {
        self.uniqueId = tvShowResult.title ?? "Shows"
        self.tvShowResult = tvShowResult
    }
    
    func render(uiDelegate: UIDelegate) -> AnyView {
        return TVShowView(tvShowResult: tvShowResult).toAny()
    }
    
    
}

struct TVShowView:View {
    
//    let columns = [
//            GridItem(.flexible()),
//            GridItem(.flexible()),
//            GridItem(.flexible()),
//            GridItem(.flexible())
//        ]
    let tvShowResult:TvShowsResult
    var body: some View {
        HStack {
            VStack {
                Text(tvShowResult.title ?? "Popular shows").font(.headline)
                Spacer()
            }
            ScrollView(.vertical,showsIndicators: false) {
                VStack {
                    ForEach(tvShowResult.results,id:\.name) { show in
                        TVShowCell(tvShow: show)
                    }
                }
            }.padding()
        }
    }
    
}


struct TVShowCell:View{
    
    var tvShow:TvShow
    var body:some View {
        VStack {
            
            KFImage(URL(string: "https://image.tmdb.org/t/p/w300/\(tvShow.poster_path)"))
                .resizable().frame(width: 300, height: 300, alignment: .center)
                .clipped()
                .cornerRadius(300/2)
            Text(tvShow.name).lineLimit(0)
            
        }
    }
}

//struct TvShowView_PreViews:PreviewProvider {
//
//    static var previews: some View {
////        TvShowView(show: TvShow(id: 12, name: "DDLJ", overview: "Boring movie", poster_path: ""))
////        TVShowVie
//    }
//
//}
