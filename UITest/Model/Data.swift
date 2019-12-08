//
//  Data.swift
//  UITest
//
//  Created by Osvaldo Murillo on 12/7/19.
//  Copyright © 2019 Osvaldo Murillo. All rights reserved.
//

import Foundation

let drinkData:[Drink] = load("drinks.json")

func load<T:Decodable>(_ filename: String, as type:T.Type = T.self) -> T {
    let data:Data
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
        else {
            fatalError("Couldn't fine \(filename) in main bundle.")
    }
    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) in main bundle:\n\(error)")
    }
    
    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
        
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
    
}
