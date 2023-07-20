//
//  RecipeHighlightsView.swift
//  ChucksRecipes
//
//  Created by Chuck Belcher on 7/19/23.
//

import SwiftUI

struct RecipeHighlightsView: View {
    
    var allHighlights = ""
    
    init (highlights:[String]) {
        
        //Loop through the highlights and append to all highlights
        for index in 0..<highlights.count {
            if index == highlights.count - 1 {
                allHighlights += highlights[index]
            } else {
                allHighlights += "\(highlights[index]), "
            }
        }
        
        
    }
    
    var body: some View {
        Text(allHighlights)
            .font(Font.custom("Avenir", size: 20))
    }
}

struct RecipeHighlightsView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeHighlightsView(highlights: ["test", "coming", "soon"])
    }
}
