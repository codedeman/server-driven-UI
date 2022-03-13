

import SwiftUI
import Combine
//import RxTest
class DataSouce:ObservableObject {
    @Published var counter = 0
}


struct Counter:View {
    
    @ObservedObject var datasource =  DataSouce()
    
    var body: some View {
        VStack {
            
            Button("Increment counter") {
                datasource.counter += 1
            }
            Text("count is \(datasource.counter)")
        }
        
    }
}


struct ItemList:View {
    
    @State private var items = ["hello","world"]
    
    @State private var intValue:Int = 0
    
    var body: some View {
        VStack {
            Button("Append item to list") {
                items.append("test")
            }
            
            List(items,id:\.self) { name in
                Text(name)
            }
            Counter()
            BlindingView(intValue: $intValue)
        }
    }
    
}


struct BlindingView:View {
    @Binding var intValue:Int
    
    var body: some View {
        VStack {
            
            Button("Increment") {
                intValue += 1
                
            }
            Text("i don't care about that \(intValue)")
        }
    }
}


struct BreweriesView: View {
    @ObservedObject var viewModel = BreweriesViewModel()
    var body: some View {
        NavigationView {
//                VStack {
//                    HStack {
//                        Text(viewModel.repoDetail?.language ?? "what the hell").foregroundColor(.black)
//                    }.onAppear {
//                        self.viewModel.fetchRepos()
//                    }
                    
                    VStack {
                        
                        ScrollView {
                            
                            ForEach(viewModel.breweries,id:\.self) { brewery in
                                BreweryView(brewery: brewery)
                                
                            }
                        }.onAppear {
                            self.viewModel.fetchBreweries()

                        }
                    }.navigationTitle(viewModel.repoDetail?.language ?? "").onAppear {
//                        self.viewModel.fetchRepos()
                    }
                    

        }.navigationTitle("I'm gona fuck for that swift ui")
//            }
            
    }
}


struct BreweryView: View {
    private let brewery: Brewery
    init(brewery: Brewery) {
        self.brewery = brewery
    }
    
    var body: some View {
        HStack {
//            Image(uiImage: UIImage(named: "beer")!)
//                .resizable()
//                .scaledToFit()
//                .frame(width: 80, height: 80)
            VStack(alignment: .leading, spacing: 15) {
                Text(brewery.name ?? "")
                    .font(.system(size: 18))
                    .foregroundColor(Color.blue)
            }
        }
    }
}
