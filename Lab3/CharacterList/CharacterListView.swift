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
            if viewModel.isLoading {
                ProgressView()
            } else if let error = viewModel.error {
                Text("Error: \(error.localizedDescription)")
            } else {
                List(viewModel.characters, id: \.name) { character in
                    Text(character.name)
                }
                .onAppear {
                    viewModel.fetchCharacters()
                }
                .navigationBarTitle("Characters")
            }
        }
    }
}
    
    struct CharacterListView_Previews: PreviewProvider {
        static var previews: some View {
            CharacterListView()
        }
    }
