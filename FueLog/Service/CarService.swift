//
//  CarService.swift
//  FueLog
//
//  Created by Deblyn Prado on 11/06/25.
//


// MARK: - Service/CarService.swift
import SwiftData

class CarService {
    private let modelContext: ModelContext
    
    init(modelContext: ModelContext) {
        self.modelContext = modelContext
    }
    
    func saveCar(model: String, brand: String, plate: String, color: String) throws {
        let newCar = Car(brand: brand, model: model, plate: plate, color: color)
        modelContext.insert(newCar)
        try modelContext.save()
    }
    
    func deleteCar(_ car: Car) throws {
        modelContext.delete(car)
        try modelContext.save()
    }
}
