//
//  AddCarView.swift
//  FueLog
//
//  Created by Deblyn Prado on 11/06/25.
//


// MARK: - Views/AddCarView.swift
import SwiftUI
import SwiftData

struct AddCarView: View {
    @Environment(\.modelContext) private var modelContext
    @Binding var selectedTab: Int
    @State private var carModel: String = ""
    
    private var carService: CarService {
        CarService(modelContext: modelContext)
    }
    
    var body: some View {
        NavigationView {
            VStack {
                TextField("Enter car model", text: $carModel)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                
                Button("Save Car") {
                    saveCar()
                }
                .disabled(carModel.isEmpty)
                .padding()
                
                Spacer()
            }
            .navigationTitle("Add Car")
        }
    }
    
    private func saveCar() {
        guard !carModel.isEmpty else { return }
        
        do {
            try carService.saveCar(model: carModel)
            carModel = ""
            selectedTab = 0 // Go back to car list
        } catch {
            print("Failed to save car: \(error)")
        }
    }
}

#Preview {
    @Previewable @State var selectedTab = 1
    return AddCarView(selectedTab: $selectedTab)
        .modelContainer(for: Car.self, inMemory: true)
}
