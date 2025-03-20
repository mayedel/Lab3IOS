//
//  ContentView.swift
//  Lab3
//
//  Created by María Espejo on 6/5/24.
//

import SwiftUI

struct CharacterListView: View {
    @ObservedObject var viewModel = CharacterListViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                if viewModel.isLoading {
                    ProgressView()
                } else if let error = viewModel.error {
                    Text("Error: \(error.localizedDescription)")
                } else {
                    List(viewModel.characters, id: \.url) { character in
                        NavigationLink(destination: CharacterDetailView(viewModel:CharacterDetailViewModel(characterId: character.id), character: character)) {
                            Text(character.name)
                        }
                        //                        .onTapGesture {
                        //                            viewModel.characterSelected(character)
                        //                        }
                    }
                }
                Spacer()
            }
            .onAppear {
                viewModel.fetchCharacters()
            }
            .navigationBarTitle("Characters")
        }
    }
}

struct CharacterListView_Previews: PreviewProvider {
    static var previews: some View {
        CharacterListView()
    }
}
