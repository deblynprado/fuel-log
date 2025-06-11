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
    var model: String
    
    init(model: String) {
        self.id = UUID()
        self.model = model
    }
}
