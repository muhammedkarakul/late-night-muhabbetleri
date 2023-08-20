//
//  Optional+Helpers.swift
//  Utility
//
//  Created by Mete Karakul on 20.08.2023.
//

import Foundation

public extension Optional {
    
    enum OptionalError: Error, LocalizedError {
        case foundNilWhileUnwrapping
        
        public var errorDescription: String? {
            switch self {
            case .foundNilWhileUnwrapping:
                return "Found nil while unwrapping."
            }
        }
    }
    
    var unwrapped: Wrapped  {
        get throws {
            switch self {
            case .none:
                throw OptionalError.foundNilWhileUnwrapping
            case .some(let wrapped):
                return wrapped
            }
        }
    }
}
