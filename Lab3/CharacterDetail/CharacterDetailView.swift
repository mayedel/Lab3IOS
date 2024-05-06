//
//  CharacterDetailView.swift
//  Lab3
//
//  Created by María Espejo on 6/5/24.
//

import SwiftUI

struct CharacterDetailView: View {
    @ObservedObject var viewModel: CharacterDetailViewModel
    
    var body: some View {
        Group {
            if let character = viewModel.character {
                Text(character.name)
            } else if viewModel.isLoading {
                ProgressView()
            } else {
                Text("Error: \(viewModel.error?.localizedDescription ?? "Unknown error")")
            }
        }
        .onAppear {
            viewModel.fetchCharacterDetail()
        }
    }
}

struct CharacterDetailView_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = CharacterDetailViewModel(characterURL: "https://swapi.dev/api/people/1/")
        return CharacterDetailView(viewModel: viewModel)
    }
}
