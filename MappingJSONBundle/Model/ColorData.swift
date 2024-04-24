//
//  ColorData.swift
//  MappingJSONBundle
//
//  Created by MacBook Pro on 24/04/24.
//

import Foundation
import SwiftUI

struct ColorData: Codable, Identifiable {
    var id: Int
    var name, color, image: String
    
    /// color from hex
    var uiColor: Color{
        colorFromHexString(color)
    }
    
    /// Image menggunakan SF Symbols
    /// Image(systemName: image)
    /// Jika dari API nya berupa String yang tidak kompatibel dengan SFSysmbol
    var uiImage: Image {
        Image(systemName: image)
    }
}

//typealias Data = [ColorData]

// MARK: -MOCK DATA
extension ColorData {
    static func loadColorData() -> [ColorData]{
        guard let url = Bundle.main.url(forResource: "Colors", withExtension: "json"), let data = try? Data(contentsOf: url) else {
            fatalError("Failed to load JSON Data from bundle")
        }
        do {
            let decodedColor = try JSONDecoder().decode([ColorData].self, from: data)
            return decodedColor
        } catch {
            fatalError("Failed to decode JSON Data from bundle: \(error.localizedDescription)")
        }
    }
}
