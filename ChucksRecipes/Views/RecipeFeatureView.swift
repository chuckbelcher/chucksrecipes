//
//  RecipeFeatureView.swift
//  ChucksRecipes
//
//  Created by Chuck Belcher on 7/12/23.
//

import SwiftUI

struct RecipeFeatureView: View {
    @EnvironmentObject var recipeModel: RecipeModel
    
    var body: some View {
        GeometryReader { geo in
            TabView {
                ForEach (0..<recipeModel.recipies.count) { index in
                    
                    if recipeModel.recipies[index].featured {
                        Rectangle()
                            .frame(width: geo.size.width - 40, height: geo.size.height - 100, alignment: .center)
                    }
                }
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .automatic))
            .indexViewStyle((PageIndexViewStyle(backgroundDisplayMode: .always)))
        }
    }
}

struct RecipeFeatureView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeFeatureView()
            .environmentObject(RecipeModel())
    }
}
