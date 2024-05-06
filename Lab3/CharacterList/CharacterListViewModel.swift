//
//  CharacterListViewModel.swift
//  Lab3
//
//  Created by María Espejo on 6/5/24.
//

import Foundation

class CharacterListViewModel: ObservableObject {
    @Published var isLoading: Bool = false
    @Published var error: Error?
    @Published var characters: [Character] = []
    private let characterUseCase = CharacterUseCase()
    
    func fetchCharacters() {
        isLoading = true
        characterUseCase.fetchCharacters { [weak self] characters in
            DispatchQueue.main.async {
                self?.isLoading = false
                if let characters = characters {
                    self?.characters = characters
                } else {
                    self?.error = NSError(domain: "CharacterListViewModel", code: 0, userInfo: [NSLocalizedDescriptionKey: "Failed to fetch characters"])
                }
            }
        }
    }

    }
