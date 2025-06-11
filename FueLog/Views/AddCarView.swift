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
    @State private var carBrand: String = ""
    @State private var carPlate: String = ""
    @State private var carColor: String = ""
    
    private var carService: CarService {
        CarService(modelContext: modelContext)
    }
    
    var body: some View {
        NavigationView {
            VStack {
                VStack {
                    TextField("Enter car Model", text: $carModel)
                    TextField("Enter car Brand", text: $carBrand)
                    TextField("Enter car Plate", text: $carPlate)
                    TextField("Enter car Color", text: $carColor)
                }
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
            try carService.saveCar(model: carModel, brand: carBrand, plate: carPlate, color: carColor)
            carModel = ""
            carBrand = ""
            carColor = ""
            carPlate = ""
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
