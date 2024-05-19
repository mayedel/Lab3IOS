//
//  CharacterUseCase.swift
//  Lab3
//
//  Created by María Espejo on 6/5/24.
//

import Foundation

class CharacterUseCase {
    let characterService = CharacterService()
    
    func fetchCharacters(completion: @escaping (Result<[Character], Error>) -> Void) {
        characterService.fetchCharacters { characters in
            if let characters = characters {
                completion(.success(characters))
            } else {
                completion(.failure(NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey: "Failed to fetch characters"])))
            }
        }
    }
    
    func fetchCharacterDetail(number: Int, completion: @escaping (Result<Character, Error>) -> Void) {
        characterService.fetchCharacterDetail(number: number) { character in
            if let character = character {
                completion(.success(character))
            } else {
                completion(.failure(NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey: "Failed to fetch character detail"])))
            }
        }
    }
}


