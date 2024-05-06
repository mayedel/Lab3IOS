//
//  CharacterDetailViewModel.swift
//  Lab3
//
//  Created by María Espejo on 6/5/24.
//

import Foundation

class CharacterDetailViewModel: ObservableObject {
    @Published var isLoading: Bool = false
    @Published var error: Error?
    @Published var character: Character?
    private let characterUseCase = CharacterUseCase()
    private let characterURL: String
    
    init(characterURL: String) {
        self.characterURL = characterURL
    }
    
    func fetchCharacterDetail() {
        isLoading = true
        characterUseCase.fetchCharacterDetail(for: characterURL) { [weak self] character in
            DispatchQueue.main.async {
                self?.isLoading = false
                if let character = character {
                    self?.character = character
                } else {
                    self?.error = NSError(domain: "CharacterDetailViewModel", code: 0, userInfo: [NSLocalizedDescriptionKey: "Failed to fetch character details"])
                }
            }
        }
    }

}

