//
//  CharacterDetailViewModel.swift
//  Lab3
//
//  Created by María Espejo on 6/5/24.
//

import Foundation

class CharacterDetailViewModel: ObservableObject {
    @Published var isLoading: Bool = false
    @Published var error: String?
    @Published var character: Character?
    private let characterUseCase = CharacterUseCase()
    
    init(character: Character? = nil) {
        self.character = character
    }
    
    func fetchCharacterDetail(for character: Character) {
        isLoading = true
        characterUseCase.fetchCharacterDetail(for: character.url) { [weak self] character in
            DispatchQueue.main.async {
                self?.isLoading = false
                if let character = character {
                    self?.character = character
                } else {
                    self?.error = "Failed to fetch character details"
                }
            }
        }
    }
    
}

