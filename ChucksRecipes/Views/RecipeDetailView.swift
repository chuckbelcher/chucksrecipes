//
//  RecipeDetailView.swift
//  ChucksRecipes
//
//  Created by Chuck Belcher on 7/8/23.
//

import SwiftUI

struct RecipeDetailView: View {
    
    var recipe: Recipe
    
    var body: some View {
        ScrollView {
            
            //TODO: Add Recipe Title 1743
            
            VStack (alignment: .leading){
                //MARK: Recipe Image
                Image(recipe.image)
                    .resizable()
                    .scaledToFill()
                
                //MARK: Ingredients
                VStack (alignment: .leading) {
                    Text("Ingredients")
                        .font(.headline)
                        .padding(.vertical, 5)
                    
                    ForEach (recipe.ingredients, id: \.self) {ingredient in
                        Text("• " + ingredient)
                    }
                }
                .padding(.horizontal, 10)
                
                Divider()
                
                //MARK: Directions
                VStack (alignment: .leading) {
                    Text("Directions")
                        .font(.headline)
                        .padding(.vertical, 5)
                    
                    
                    ForEach (0..<recipe.directions.count, id: \.self) {index in
                        Text(String(index + 1) + ". " + recipe.directions[index])
                            .padding(.bottom, 5)
                    }
                }
                .padding(.horizontal, 10)
            }
        }
    }
}

struct RecipeDetailView_Previews: PreviewProvider {
    static var previews: some View {
        let recipeModel = RecipeModel()
        RecipeDetailView(recipe: recipeModel.recipies[0])
    }
}
