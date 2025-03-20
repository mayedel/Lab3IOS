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
    @Published var characterId: Int?
    
    
    func fetchCharacters() {
           isLoading = true
           characterUseCase.fetchCharacters { [weak self] result in
               DispatchQueue.main.async {
                   self?.isLoading = false
                   switch result {
                   case .success(let characters):
                       self?.characters = characters
                   case .failure(let error):
                       self?.error = error
                   }
               }
           }
       }
    
    func characterSelected(_ character: Character) {
        self.characterId = character.id
        }

    }
