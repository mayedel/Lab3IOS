//
//  CharacterService.swift
//  Lab3
//
//  Created by María Espejo on 6/5/24.
//

import Foundation

class CharacterService {
    let apiManager = APIManager()
    
    func fetchCharacters(completion: @escaping ([Character]?) -> Void) {
        apiManager.fetchCharacters(completion: completion)
    }
    
    func fetchCharacterDetail(for characterURL: String, completion: @escaping (Character?) -> Void) {
        apiManager.fetchCharacterDetail(for: characterURL, completion: completion)
    }
}
