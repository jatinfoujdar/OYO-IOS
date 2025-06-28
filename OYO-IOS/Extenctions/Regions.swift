//
//  Regions.swift
//  OYO-IOS
//
//  Created by jatin foujdar on 25/05/25.
//

import CoreLocation
import SwiftUI

extension CLLocationCoordinate2D {
    static var losAngeles = CLLocationCoordinate2D(latitude: 34.0522, longitude: -118.2437)
    static var miami = CLLocationCoordinate2D(latitude: 25.7617, longitude: -80.1918)
}


extension Color {
    init(hex: String) {
        let scanner = Scanner(string: hex)
        _ = scanner.scanString("#") // skip the #
        var rgb: UInt64 = 0
        scanner.scanHexInt64(&rgb)

        let r = Double((rgb >> 16) & 0xFF) / 255
        let g = Double((rgb >> 8) & 0xFF) / 255
        let b = Double(rgb & 0xFF) / 255

        self.init(red: r, green: g, blue: b)
    }
}
