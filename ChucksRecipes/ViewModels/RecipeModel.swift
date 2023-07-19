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
        self.recipies = DataService.getLocalData()
        
    }
    
    //static functions can be called without creating an instance of the model.
    static func getPortion(ingredient: Ingredient, recipeServings:Int, targetServings: Int) -> String {
        
        //Get single serving size  by multiplying denominator by the recipe servings
        
        
        //Get terget serving size by multiplying the numerator by the number of servings
        
        
        //Simplify and reduce by greatest common divisor
        
        
        //Get whole portion is numerator > denominator
        
        
        //Get remainder and convert to fraction
        
        
        //Return portion size
        
        return String(targetServings)
    }
    
}
