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
        VStack (alignment: .leading, spacing: 0) {
            
            Text("Featured Recipies")
                .padding(.leading)
                .padding(.top, 40)
                .font(.largeTitle)
                .bold()
            
            GeometryReader { geo in
                TabView {
                    ForEach (0..<recipeModel.recipies.count) { index in
                        
                        if recipeModel.recipies[index].featured {
                            ZStack {
                                Rectangle()
                                    .foregroundColor(.white)
                                VStack (spacing: 0) {
                                    Image(recipeModel.recipies[index].image)
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .clipped()
                                    Text(recipeModel.recipies[index].name)
                                        .font(.title)
                                        .padding(5)
                                }
                            }
                            .frame(width: geo.size.width - 40, height: geo.size.height - 100, alignment: .center)
                            .cornerRadius(25)
                            .shadow(color: Color(.init(srgbRed: 0, green: 0, blue: 0, alpha: 0.5)), radius: 10, x: -5, y: 5)
                        }
                    }
                }
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .automatic))
                .indexViewStyle((PageIndexViewStyle(backgroundDisplayMode: .always)))
            }
            
            VStack (alignment: .leading, spacing: 10) {
                Text("Preperation Time")
                    .font(.headline)
                Text("1 hour")
                Text("Highlights")
                    .font(.headline)
                Text("Healthy, Hearty")
            }
            .padding([.leading, .bottom])
        }
    }
}

struct RecipeFeatureView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeFeatureView()
            .environmentObject(RecipeModel())
    }
}
