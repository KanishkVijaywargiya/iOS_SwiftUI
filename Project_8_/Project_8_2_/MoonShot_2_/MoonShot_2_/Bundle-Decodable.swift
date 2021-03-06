//
//  Bundle-Decodable.swift
//  MoonShot_2_
//
//  Created by kanishk vijaywargiya on 13/03/21.
//

import Foundation

extension Bundle {
    func decode<T: Codable>(_ file: String) -> T {
        print(file)
        guard let url = self.url(forResource: file, withExtension: nil) else {
            fatalError("Failed to locate \(file) in bundle.")
        }
        
        guard let data = try? Data(contentsOf: url) else {
            fatalError("Failed to load \(file) from bundle.")
        }
        
        let decoder = JSONDecoder()

        let formatter = DateFormatter()
        formatter.dateFormat = "yy-MM-dd"
        decoder.dateDecodingStrategy = .formatted(formatter)
        
        guard let loaded = try? decoder.decode(T.self, from: data) else {
            fatalError("Failde to decode \(file) from bundle")
        }
        
        return loaded
    }
}
