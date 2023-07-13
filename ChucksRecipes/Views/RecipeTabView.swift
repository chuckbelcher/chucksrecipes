//
//  RecipeTabView.swift
//  ChucksRecipes
//
//  Created by Chuck Belcher on 7/10/23.
//

import SwiftUI

struct RecipeTabView: View {
    
    var body: some View {
        TabView {
            RecipeFeatureView()
                .tabItem {
                    VStack {
                        Image(systemName: "star")
                        Text("Featured")
                    }
                }
            RecipeListView()
                .tabItem {
                    VStack {
                        Image(systemName: "list.bullet")
                        Text("Recipies")
                    }
                }
        }
        .environmentObject(RecipeModel())
    }
}

struct RecipeTabView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeTabView()

    }
}
