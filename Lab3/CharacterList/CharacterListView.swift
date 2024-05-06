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

struct CharacterListView_Previews: PreviewProvider {
    static var previews: some View {
        CharacterListView()
    }
}
