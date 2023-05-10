//
//  Favorites.swift
//  SnowSeeker
//
//  Created by Tamim Khan on 10/5/23.
//

import SwiftUI


class Favorites: ObservableObject{
   @Published private(set) var resorts: Set<String>
    
    
    private let saveKey = "Favorites"
    
    init(){
        
        if let data = UserDefaults.standard.data(forKey: saveKey){
            if let decode = try? JSONDecoder().decode(Set<String>.self, from: data){
                resorts = decode
               return
            }
        }
        resorts = []
      
        
        
    }
    
    
    func contains(_ resort: Resort) -> Bool{
        resorts.contains(resort.id)
    }
    
    
    func add(_ resort: Resort){
        objectWillChange.send()
        resorts.insert(resort.id)
        save()
    }
    
    func remove(_ resort: Resort){
        objectWillChange.send()
        resorts.remove(resort.id)
        save()
    }
    
    func save(){
        if let data = try? JSONEncoder().encode(resorts){
            UserDefaults.standard.set(data, forKey: saveKey)
        }
    }
}
