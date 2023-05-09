//
//  ResortsView.swift
//  SnowSeeker
//
//  Created by Tamim Khan on 9/5/23.
//

import SwiftUI

struct ResortsView: View {
    let resort: Resort
    
    
    var body: some View {
        ScrollView{
            VStack(alignment: .leading, spacing: 0){
                Image(decorative: resort.id)
                    .resizable()
                    .scaledToFit()
                
                HStack{
                    SkiDetailsView(resort: resort)
                    ResortDetailsView(resort: resort)
                }
                .padding(.vertical)
                .background(Color.primary.opacity(0.1))
                
                
                Group{
                    Text(resort.description)
                        .padding(.vertical)
                    
                    
                    Text("Facilities")
                        .font(.headline)
                    
                    Text(resort.facilities, format: .list(type: .and))
                        .padding(.vertical)
                }
                .padding(.horizontal)
            }
            
            .navigationTitle("\(resort.name), \(resort.country)")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct ResortsView_Previews: PreviewProvider {
    static var previews: some View {
        ResortsView(resort: Resort.example)
    }
}
