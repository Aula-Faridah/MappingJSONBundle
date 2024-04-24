//
//  ContentView.swift
//  MappingJSONBundle
//
//  Created by MacBook Pro on 24/04/24.
//

import SwiftUI

struct ContentView: View {
    let colorData = ColorData.loadColorData()
    
    var body: some View {
        NavigationStack {
            List{
                ForEach(colorData) { datum in
                    ColorRow(items: datum)
                }
            }
            .navigationTitle("Color")
        }
    }
}

#Preview {
    ContentView()
}

struct ColorRow: View {
    var items: ColorData
    var body: some View {
        
        HStack(spacing: 16){
            items.uiImage
                .resizable()
                .scaledToFit()
                .frame(width: 50, height: 50)
                .padding()
                .background(items.uiColor)
                .clipShape(RoundedRectangle(cornerRadius: 16))
                .foregroundStyle(.white)
            
            Text(items.name)
                .font(.title)
                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
        }
    }
}
