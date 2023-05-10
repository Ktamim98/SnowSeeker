//
//  ResortsView.swift
//  SnowSeeker
//
//  Created by Tamim Khan on 9/5/23.
//

import SwiftUI

struct ResortsView: View {
    let resort: Resort
    
    
    @Environment(\.horizontalSizeClass) var sizeClass
    @Environment(\.dynamicTypeSize) var typeSize
    
    
    
    @State private var selectedFacility: Facility?
    @State private var showingFacility = false
    
    @EnvironmentObject var favorites: Favorites
    
    
    var body: some View {
        ScrollView{
            VStack(alignment: .leading, spacing: 0){
                ZStack{
                    Image(decorative: resort.id)
                        .resizable()
                        .scaledToFit()
                        .overlay(
                            Text(resort.imageCredit)
                        .foregroundColor(.white)
                        .padding(.all, 10)
                        .background(Color.black.opacity(0.8))
                        .cornerRadius(10)
                        .offset(x: 10, y: -10),
                        alignment: .bottomLeading
                        )
                       
                }
                
                HStack{
                    if sizeClass == .compact && typeSize > .large{
                        VStack(spacing: 10) {SkiDetailsView(resort: resort)}
                        VStack(spacing: 10){ResortDetailsView(resort: resort)}
                    }else{
                        SkiDetailsView(resort: resort)
                        ResortDetailsView(resort: resort)
                    }
                }
                .padding(.vertical)
                .background(Color.primary.opacity(0.1))
                .dynamicTypeSize(...DynamicTypeSize.xxxLarge)
                
                
                Group{
                    Text(resort.description)
                        .padding(.vertical)
                    
                    
                    Text("Facilities")
                        .font(.headline)
                    
                    //                    Text(resort.facilities, format: .list(type: .and))
                    //                        .padding(.vertical)
                    
                    HStack{
                        ForEach(resort.facilityType){ facility in
                            Button{
                                selectedFacility = facility
                                showingFacility = true
                            }label: {
                                facility.icon
                                    .font(.title)
                            }
                        }
                    }
                    
                    Button(favorites.contains(resort) ? "Remove from favorite" : "Add favorite"){
                        if favorites.contains(resort){
                            favorites.remove(resort)
                            
                        }else{
                            favorites.add(resort)
                        }
                    }
                    .buttonStyle(.borderedProminent)
                    .padding()
                }
                .padding(.horizontal)
            }
        }
            
            .navigationTitle("\(resort.name), \(resort.country)")
            .navigationBarTitleDisplayMode(.inline)
            .alert(selectedFacility?.name ?? "More information", isPresented: $showingFacility, presenting: selectedFacility){ _ in
            }message: { facility in
                Text(facility.descriptions)
            }
        }
    }


struct ResortsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            ResortsView(resort: Resort.example)
        }
        .environmentObject(Favorites())
    }
}
