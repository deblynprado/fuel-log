//
//  Item.swift
//  FueLog
//
//  Created by Deblyn Prado on 09/06/25.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
