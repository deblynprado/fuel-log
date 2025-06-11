//
//  Car.swift
//  FueLog
//
//  Created by Deblyn Prado on 11/06/25.
//


// MARK: - Model/Car.swift
import Foundation
import SwiftData

@Model
class Car {
    var id: UUID
    var brand: String
    var model: String
    var plate: String
    var color: String
    
    init(brand: String, model: String, plate: String, color: String) {
        self.id = UUID()
        self.brand = brand
        self.model = model
        self.plate = plate
        self.color = color
    }
}
