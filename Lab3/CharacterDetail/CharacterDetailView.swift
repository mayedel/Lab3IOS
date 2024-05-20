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
                Text("Error: \(errorMessage.localizedDescription)")
            } else if let character = viewModel.character {
                CharacterDetailContent(character: character)
//                List {
//                    DetailRow(title: "Name", value: character.name)
//                    DetailRow(title: "Height", value: character.height)
//                    DetailRow(title: "Mass", value: character.mass)
//                    DetailRow(title: "Hair Color", value: character.hairColor)
//                    DetailRow(title: "Skin Color", value: character.skinColor)
//                    DetailRow(title: "Eye Color", value: character.eyeColor)
//                    DetailRow(title: "Birth Year", value: character.birthYear)
//                    DetailRow(title: "Gender", value: character.gender)
//                }
            } else {
                Text("Loading...")
                    .onAppear {
                        viewModel.fetchCharacterDetail()
                    }
            }
        }
        .navigationTitle("Character Detail")
        
    }
}

struct CharacterDetailContent: View {
    let character: Character
    
    var body: some View {
        List {
            DetailRow(title: "Name", value: character.name)
            DetailRow(title: "Height", value: character.height)
            DetailRow(title: "Mass", value: character.mass)
            DetailRow(title: "Hair Color", value: character.hairColor)
            DetailRow(title: "Skin Color", value: character.skinColor)
            DetailRow(title: "Eye Color", value: character.eyeColor)
            DetailRow(title: "Birth Year", value: character.birthYear)
            DetailRow(title: "Gender", value: character.gender)
        }
    }
}

struct DetailRow: View {
    let title: String
    let value: String
    
    var body: some View {
        HStack {
            Text(title)
            Spacer()
            Text(value)
        }
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
        let viewModel = CharacterDetailViewModel(characterId: 1)
        return CharacterDetailView(viewModel: viewModel, character: sampleCharacter)
    }
}
