//
//  RecipeModel.swift
//  ChucksRecipes
//
//  Created by Chuck Belcher on 7/7/23.
//

import Foundation

class RecipeModel: ObservableObject {
    
    @Published var recipies = [Recipe]()
    
    init() {
        
        //Create an instance of the data service
        let ds = DataService()
        self.recipies = ds.getLocalData()
    }
}
