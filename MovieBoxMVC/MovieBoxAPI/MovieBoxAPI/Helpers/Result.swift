//
//  Result.swift
//  MovieBoxAPI
//
//  Created by Muhammed Karakul on 2.07.2022.
//

import Foundation

public enum Result<Value> {
    case success(Value)
    case failure(Error)
}
