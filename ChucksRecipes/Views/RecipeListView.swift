//
//  ContentView.swift
//  ChucksRecipes
//
//  Created by Chuck Belcher on 7/1/23.
//

import SwiftUI

struct RecipeListView: View {
    
    @EnvironmentObject var recipeModel: RecipeModel
    
    var body: some View {

        NavigationView {
            VStack (alignment: .leading) {
                Text("All Recipies")
                    .padding(.top, 40)
                    .font(.largeTitle)
                    .bold()
                ScrollView {
                    LazyVStack (alignment: .leading) {
                        ForEach(recipeModel.recipies) { recipe in
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
                    }
                }
            }
            .padding(.leading)
        }
        .navigationBarHidden(true)
    }
}

struct RecipeListView_Previews: PreviewProvider {
    @EnvironmentObject var recipeModel: RecipeModel
    static var previews: some View {
        RecipeListView()
            .environmentObject(RecipeModel())
    }
}
