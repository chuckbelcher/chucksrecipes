//
//  ContentView.swift
//  ChucksRecipes
//
//  Created by Chuck Belcher on 7/1/23.
//

import SwiftUI

struct RecipeListView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
        }
        .padding()
    }
}

struct RecipeListView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeListView()
    }
}
