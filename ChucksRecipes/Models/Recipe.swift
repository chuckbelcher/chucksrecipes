//
//  Recipe.swift
//  ChucksRecipes
//
//  Created by Chuck Belcher on 7/7/23.
//

import Foundation


class Recipe: Identifiable, Decodable {
    
    var id: UUID?
    var name: String
    var featured: Bool
    var image: String
    var description: String
    var prepTime: String
    var totalTime: String
    var servings: Int
    var ingredients: [Ingredient]
    var highlights: [String]
    var directions: [String]
    
}
