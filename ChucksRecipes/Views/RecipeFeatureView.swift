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
        Text("Hello Recipe Feature View")
    }
}

struct RecipeFeatureView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeFeatureView()
    }
}
