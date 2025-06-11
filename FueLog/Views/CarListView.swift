//
//  CarListView.swift
//  FueLog
//
//  Created by Deblyn Prado on 11/06/25.
//


// MARK: - Views/CarListView.swift
import SwiftUI
import SwiftData

struct CarListView: View {
    @Query var cars: [Car]
    @Environment(\.modelContext) private var modelContext
    
    private var carService: CarService {
        CarService(modelContext: modelContext)
    }
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(cars, id: \.id) { car in
                    HStack {
                        Text(car.model)
                        Spacer()
                        Text(car.plate)
                    }
                }
                .onDelete(perform: deleteCars)
            }
            .navigationTitle("My Cars")
        }
    }
    
    private func deleteCars(offsets: IndexSet) {
        for index in offsets {
            do {
                try carService.deleteCar(cars[index])
            } catch {
                print("Failed to delete car: \(error)")
            }
        }
    }
}


#Preview {
    CarListView()
        .modelContainer(for: Car.self, inMemory: true)
}
