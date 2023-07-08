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

            List(recipeModel.recipies) { recipie in
                HStack (spacing: 20) {
                    Image(recipie.image)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 50, height: 50)
                        .clipped()
                        .cornerRadius(10)
                    Text(recipie.name)
                }
            }

    }
}

struct RecipeListView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeListView()
    }
}
