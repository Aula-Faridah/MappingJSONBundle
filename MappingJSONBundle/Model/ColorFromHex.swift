//
//  ColorFromHex.swift
//  MappingJSONBundle
//
//  Created by MacBook Pro on 24/04/24.
//

import Foundation
import SwiftUI

func colorFromHexString(_ hex: String) -> Color {
    ///#25h319
    /// Lakukan proses triming
    ///Membuang spasi di awal dan akhir string
    ///menjadikan hex string nya uppercase
    
    let hex = hex.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines).uppercased()
    
    ///Validasi HEX
    ///- Asumsi HEX color itu tanpa alpha, maka jumlahnya 6 digit
    ///- Handle HEX jumlahnya menjadi 7 digit karena termasuk prefix #
    
    guard hex.count == 6 || (hex.count == 7 && hex.hasPrefix("#")) else {
        return Color(red: 0, green: 0, blue: 0) // Default colot
    }
    
    /// Proses konversi HEX
    /// Konversi dari String HEX dari API menjadi Color Swift
    
    let hexColor = hex.hasPrefix("#") ? String(hex.dropFirst()) : hex
    
    ///  Ekstrak komponen Color kedalam susunan RGB (RRGGBB) 25h319
    
    let redColor = hexColor.prefix(2)
    let greenColor = hexColor.dropFirst(2).prefix(2)
    let blueColor = hexColor.suffix(2)
    
    ///1. Konversi HEX ke Integer untuk divalidasi kembali
    ///2. Radix basis sistem bilangan matematika
    ///3. Dari konsep Radix, kita gunakan konversi string 0-9 dan A-Z menjadi integer
    
    guard let r = UInt64(redColor, radix: 16),
          let g = UInt64(greenColor, radix: 16),
          let b = UInt64(blueColor, radix: 16)
    else {
        return Color(red: 0, green: 0, blue: 0)
    }
    
    let results = Color(red: Double(r) / 255.0, green: Double(g) / 255.0, blue: Double(b) / 255.0 )
    
    return results
}
