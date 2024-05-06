//
//  Character.swift
//  Lab3
//
//  Created by María Espejo on 6/5/24.
//

import Foundation

struct Character: Codable {
    let name: String
    let height: String
    let mass: String
    let hairColor: String
    let skinColor: String
    let eyeColor: String
    let birthYear: String
    let gender: String
}

struct CharacterListResponse: Codable {
    let results: [Character]
}

