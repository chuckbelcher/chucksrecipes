//
//  RecipeDetailView.swift
//  ChucksRecipes
//
//  Created by Chuck Belcher on 7/8/23.
//

import SwiftUI

struct RecipeDetailView: View {
    
    var recipe: Recipe
    @State var servingSize = 2
    
    var body: some View {
        ScrollView {
            
            VStack (alignment: .leading){
                //MARK: Recipe Image
                Image(recipe.image)
                    .resizable()
                    .scaledToFill()
                
                Text(recipe.name)
                    .padding([.leading, .top])
                    .font(.largeTitle)
                    .bold()
                
                VStack (alignment: .leading) {
                    //MARK: Serving Size Picker
                    Text("Serving Size")
                        .font(.headline)
                        
                    
                    Picker("",selection: $servingSize) {
                        Text("2").tag(2)
                        Text("4").tag(4)
                        Text("6").tag(6)
                        Text("8").tag(8)
                    }
                    .pickerStyle(.segmented)
                    .frame(width: 200)
                }
                .padding(10)
                
                //MARK: Ingredients
                VStack (alignment: .leading) {
                    Text("Ingredients")
                        .font(.headline)
                        .padding(.vertical, 5)
                    
                    ForEach (recipe.ingredients) {ingredient in
                        Text("• " + RecipeModel.getPortion(ingredient: ingredient , recipeServings: recipe.servings, targetServings: servingSize) + " " + ingredient.name.lowercased())
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
        RecipeDetailView(recipe: recipeModel.recipies[1])
    }
}
