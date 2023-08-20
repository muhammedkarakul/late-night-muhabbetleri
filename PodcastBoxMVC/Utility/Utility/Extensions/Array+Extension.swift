//
//  Array+Extension.swift
//  Utility
//
//  Created by Mete Karakul on 20.08.2023.
//

import Foundation

extension Array {
    
    enum ArrayError: Error, LocalizedError {
        
        case indexOutOfBoundaries
        
        var errorDescription: String? {
            
            switch self {
            case .indexOutOfBoundaries:
                return "Index out of boundaries."
            }
        }
    }
    
    public func element(at index: Int) throws -> Element {
        guard index >= 0 && index < self.count else {
            throw ArrayError.indexOutOfBoundaries
        }
        return self[index]
    }
}
