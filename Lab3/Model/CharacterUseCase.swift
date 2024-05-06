//
//  CharacterUseCase.swift
//  Lab3
//
//  Created by María Espejo on 6/5/24.
//

import Foundation

class CharacterUseCase {
    let characterService = CharacterService()
    
    func fetchCharacters(completion: @escaping ([Character]?) -> Void) {
        characterService.fetchCharacters(completion: completion)
    }
    
    func fetchCharacterDetail(for characterURL: String, completion: @escaping (Character?) -> Void) {
        characterService.fetchCharacterDetail(for: characterURL, completion: completion)
    }
}

