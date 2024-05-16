//
//  CharacterDetailView.swift
//  Lab3
//
//  Created by María Espejo on 6/5/24.
//

import SwiftUI

struct CharacterDetailView: View {
    @ObservedObject var viewModel: CharacterDetailViewModel
    let character: Character
    
    var body: some View {
        VStack {
            if let errorMessage = viewModel.error {
                Text("Error: \(errorMessage)")
            } else if let character = viewModel.character {
                Text("Name: \(character.name)")
                Text("Height: \(character.height)")
                Text("Mass: \(character.mass)")
                Text("Hair Color: \(character.hairColor)")
                Text("Skin Color: \(character.skinColor)")
                Text("Eye Color: \(character.eyeColor)")
                Text("Birth Year: \(character.birthYear)")
                Text("Gender: \(character.gender)")
            } else {
                Text("Loading...")
                    .onAppear {
                        viewModel.fetchCharacterDetail(for: character)
                    }
            }
        }
        .navigationTitle("Character Detail")
        
    }
}

struct CharacterDetailView_Previews: PreviewProvider {
    static var previews: some View {
        let sampleCharacter = Character(
            name: "Luke Skywalker",
            height: "172",
            mass: "77",
            hairColor: "blond",
            skinColor: "fair",
            eyeColor: "blue",
            birthYear: "19BBY",
            gender: "male",
            homeworld: "",
            films: [],
            species: [],
            vehicles: [],
            starships: [],
            created: "",
            edited: "",
            url: ""
        )
        let viewModel = CharacterDetailViewModel(character: sampleCharacter)
        return CharacterDetailView(viewModel: viewModel, character: sampleCharacter)
    }
}
