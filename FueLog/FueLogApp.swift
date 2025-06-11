//
//  FueLogApp.swift
//  FueLog
//
//  Created by Deblyn Prado on 09/06/25.
//

import SwiftUI
import SwiftData

@main
struct FuelLogApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: Car.self)
    }
}
