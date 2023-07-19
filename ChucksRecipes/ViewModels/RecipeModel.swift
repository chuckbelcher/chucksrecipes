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
        
        var portion = ""
        var numerator = ingredient.num ?? 1
        var denominator = ingredient.denom ?? 1
        var wholeNumber = 0
        
        
        if ingredient.num != nil {
            
            //Get single serving size  by multiplying denominator by the recipe servings
            denominator = denominator * recipeServings
            
            //Get terget serving size by multiplying the numerator by the number of servings
            numerator = numerator * targetServings
            
            //Simplify and reduce by greatest common divisor
            let divisor = Rational.greatestCommonDivisor(numerator, denominator)
            numerator = numerator / divisor
            denominator = denominator / divisor
            
            //Get whole portion is numerator > denominator
            if numerator >= denominator {
                
                wholeNumber = numerator / denominator
                numerator = numerator % denominator
                
                //assign to portion string
                
                portion += String(wholeNumber)
                
            }
            
            //Get remainder and convert to fraction
            if numerator > 0 {
                
                //Check to see if there is a whole number and add space if needed
                portion += wholeNumber > 0 ? " " : ""
                
                //Assign fraction to portion string
                portion += numerator == denominator ? "\(denominator)" : "\(numerator)/\(denominator)"
                
            }
            
            
        }
        
        if var unit = ingredient.unit {
            
            
            if wholeNumber > 1 {
                
                if unit.suffix(2) == "ch" {
                    unit += "es"
                } else if unit.suffix(1) == "f" {
                    unit = String(unit.dropLast())
                    unit += "ves"
                } else {
                    unit += "s"
                }
                
            }
            
            
            
            portion += ingredient.num == nil && ingredient.denom == nil ? "" : " "
            
            return portion + unit
            
        }
        
        return portion
    }
    
}
