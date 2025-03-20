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
    private var characterId: Int
    
    init(characterId: Int) {
        self.characterId = characterId
    }
    
    func fetchCharacterDetail() {
            isLoading = true
        characterUseCase.fetchCharacterDetail(number: characterId) { [weak self] result in
                DispatchQueue.main.async {
                    self?.isLoading = false
                    switch result {
                    case .success(let character):
                        self?.character = character
                    case .failure(let error):
                        self?.error = error
                    }
                }
            }
        }
    
}

