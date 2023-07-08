//
//  DataService.swift
//  ChucksRecipes
//
//  Created by Chuck Belcher on 7/7/23.
//

import Foundation

class DataService {
    
    func getLocalData() -> [Recipe] {
        
        //Parse local JSON file
        let filePath = Bundle.main.path(forResource: "recipes", ofType: "json")
        guard filePath != nil else {
            return [Recipe]()
        }
        
        let url = URL(fileURLWithPath: filePath!)
        
        do {
            let data = try Data(contentsOf: url)
            let decoder = JSONDecoder()
            do {
                let recipeData = try decoder.decode([Recipe].self, from: data)
                
                for recipe in recipeData {
                    recipe.id = UUID()
                }
                
                return recipeData
                
            } catch {
                print(error)
            }
        } catch {
            print(error)
        }
        
        return [Recipe]()
    }
}
