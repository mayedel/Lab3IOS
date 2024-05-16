//
//  APIManager.swift
//  Lab3
//
//  Created by María Espejo on 6/5/24.
//

import Alamofire
import Foundation

class APIManager {
    let url = "https://swapi.dev/api/people/"
    
    func fetchCharacters(completion: @escaping ([Character]?) -> Void) {
        AF.request(url).responseDecodable(of: CharacterListResponse.self) { response in
            switch response.result {
            case .success(let result):
                completion(result.results)
            case .failure(let error):
                print("Error fetching character list: \(error)")
                completion(nil)
            }
        }
    }
    
    func fetchCharacterDetail(for characterURL: String, completion: @escaping (Character?) -> Void) {
        AF.request(characterURL).responseDecodable(of: Character.self) { response in
            switch response.result {
            case .success(let character):
                completion(character)
            case .failure(let error):
                print("Error fetching character detail: \(error)")
                completion(nil)
            }
        }
    }
}
