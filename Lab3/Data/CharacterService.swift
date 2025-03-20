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
        apiManager.requestCharacterList { characters in
            completion(characters)
        } failure: { error in
            print("Failed to fetch characters: \(error)")
            completion(nil)
        }
    }
    
    func fetchCharacterDetail(number: Int, completion: @escaping (Character?) -> Void) {
        apiManager.requestCharacterDetail(number: number) { character in
            completion(character)
        } failure: { error in
            print("Failed to fetch character detail: \(error)")
            completion(nil)
        }
    }
}

