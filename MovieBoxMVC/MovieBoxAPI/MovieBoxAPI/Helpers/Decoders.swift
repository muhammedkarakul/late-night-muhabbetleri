//
//  Decoders.swift
//  MovieBoxAPI
//
//  Created by Muhammed Karakul on 26.06.2022.
//

import Foundation

public enum Decoders {
    static let plainDateDecoder: JSONDecoder = {
        let decoder = JSONDecoder()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        decoder.dateDecodingStrategy = .formatted(dateFormatter)
        return decoder
    }()
}
