//
//  ContentView.swift
//  SnowSeeker
//
//  Created by Tamim Khan on 9/5/23.
//

import SwiftUI

//extension View {
//    @ViewBuilder func phoneOnlyStackNavigationView() -> some View {
//        if UIDevice.current.userInterfaceIdiom == .phone {
//            self.navigationViewStyle(.stack)
//        } else {
//            self
//        }
//    }
//}

struct ContentView: View {
    
    
    let resorts: [Resort] = Bundle.main.decode("resorts.json")
    
    @State private var searchText = ""
    
    
    var filterResult: [Resort]{
        if searchText.isEmpty{
            return resorts
        }else{
            return resorts.filter{$0.name.localizedCaseInsensitiveContains(searchText)}
        }
    }
    
    var body: some View {
        NavigationView{
            List(filterResult) { resort in
                NavigationLink{
                    ResortsView(resort: resort)
                }label: {
                    Image(resort.country)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 40, height: 25)
                        .clipShape(
                            RoundedRectangle(cornerRadius: 5)
                        )
                        .overlay(
                            RoundedRectangle(cornerRadius: 5)
                                .stroke(.black, lineWidth: 1)
                        )
                    
                    VStack(alignment: .leading){
                        Text(resort.name)
                            .font(.headline)
                        Text("\(resort.runs) runs")
                            .foregroundColor(.secondary)
                    }
                }
            }
            .navigationTitle("Resorts")
//            .phoneOnlyStackNavigationView()
            .searchable(text: $searchText, prompt: "Search for find the resort")
            
            WelcomeView()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
