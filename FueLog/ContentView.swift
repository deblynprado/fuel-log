//
//  ContentView.swift
//  FueLog
//
//  Created by Deblyn Prado on 11/06/25.
//


// MARK: - ContentView.swift
import SwiftUI
import SwiftData

struct ContentView: View {
    @State private var selectedTab = 0
    
    var body: some View {
        TabView(selection: $selectedTab) {
            CarListView()
                .tabItem {
                    Image(systemName: "car")
                    Text("Cars")
                }
                .tag(0)
            
            AddCarView(selectedTab: $selectedTab)
                .tabItem {
                    Image(systemName: "plus")
                    Text("Add Car")
                }
                .tag(1)
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(for: Car.self, inMemory: true)
}
