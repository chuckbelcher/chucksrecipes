//
//  RecipeFeatureView.swift
//  ChucksRecipes
//
//  Created by Chuck Belcher on 7/12/23.
//

import SwiftUI

struct RecipeFeatureView: View {
    @EnvironmentObject var recipeModel: RecipeModel
    @State var tabSelectionIndex = 0
    @State var isDetailViewShowing = false
    
    var body: some View {
        
        let featuredRecipes = recipeModel.recipies.filter({ $0.featured })
        
        VStack (alignment: .leading, spacing: 0) {
            
            Text("Featured Recipies")
                .padding(.leading)
                .padding(.top, 40)
                .font(.largeTitle)
                .bold()
            
            GeometryReader { geo in
                TabView (selection: $tabSelectionIndex) {
                    ForEach (0..<featuredRecipes.count, id:\.self) { index in
                            Button {
                                self.isDetailViewShowing = true
                            } label: {
                                ZStack {
                                    Rectangle()
                                        .foregroundColor(.white)
                                    VStack (spacing: 0) {
                                        Image(featuredRecipes[index].image)
                                            .resizable()
                                            .aspectRatio(contentMode: .fill)
                                            .clipped()
                                        Text(featuredRecipes[index].name)
                                            .font(.title)
                                            .padding()
                                    }
                                }
                            }
                            .tag(index)
                            .buttonStyle(PlainButtonStyle())
                            .frame(width: geo.size.width - 40, height: geo.size.height - 100, alignment: .center)
                            .cornerRadius(25)
                            .shadow(color: Color(.init(srgbRed: 0, green: 0, blue: 0, alpha: 0.5)), radius: 10, x: -5, y: 5)
                    }
                }
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .automatic))
                .indexViewStyle((PageIndexViewStyle(backgroundDisplayMode: .always)))
            }
            
            VStack (alignment: .leading, spacing: 10) {
                Text("Preperation Time")
                    .font(.headline)
                Text(recipeModel.recipies[tabSelectionIndex].prepTime)
                Text("Highlights")
                    .font(.headline)
                RecipeHighlightsView(highlights: recipeModel.recipies[tabSelectionIndex].highlights)
            }
            .padding([.leading, .bottom])
        }
        .sheet(isPresented: $isDetailViewShowing) {
            RecipeDetailView(recipe: featuredRecipes[tabSelectionIndex])
        }
        
    }
}

struct RecipeFeatureView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeFeatureView()
            .environmentObject(RecipeModel())
    }
}
