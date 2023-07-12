//
//  Ingredient.swift
//  ChucksRecipes
//
//  Created by Chuck Belcher on 7/11/23.
//

import Foundation

class Ingredient: Identifiable, Decodable {
    
    var id: UUID?
    var name: String
    var num: Int?
    var denom: Int?
    var unit: String?
    
}
