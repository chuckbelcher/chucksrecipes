//
//  ContentView.swift
//  ChucksRecipes
//
//  Created by Chuck Belcher on 7/1/23.
//

import SwiftUI

struct RecipeListView: View {
    
    @ObservedObject var recipeModel = RecipeModel()
    
    var body: some View {

        NavigationView {
            List(recipeModel.recipies) { recipe in
                
                NavigationLink {
                    RecipeDetailView(recipe: recipe)
                } label: {
                    HStack (spacing: 20) {
                        Image(recipe.image)
                            .resizable()
                            .scaledToFill()
                            .frame(width: 50, height: 50)
                            .clipped()
                            .cornerRadius(10)
                        Text(recipe.name)
                    }
                }

                    
            }
            .navigationBarTitle("All Recipes")
        }

    }
}

struct RecipeListView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeListView()
    }
}
