//
//  APIManager.swift
//  Lab3
//
//  Created by María Espejo on 6/5/24.
//

import Alamofire
import Foundation

class APIManager {
    let baseUrl = "https://swapi.dev/api/people/"
    private var sessionManager: Alamofire.Session
    
    class WildcardServerTrustPolicyManager: ServerTrustManager {
        override func serverTrustEvaluator(forHost host: String) throws -> ServerTrustEvaluating? {
            if let policy = evaluators[host] {
                return policy
            }
            var domainComponents = host.split(separator: ".")
            if domainComponents.count > 2 {
                domainComponents[0] = "*"
                let wildcardHost = domainComponents.joined(separator: ".")
                return evaluators[wildcardHost]
            }
            return nil
        }
    }
    
    init(){
        let serverTrustPolicies: [String:ServerTrustEvaluating] = [
            "*.swapi.dev": PinnedCertificatesTrustEvaluator()
        ]
        let wildcard = WildcardServerTrustPolicyManager(evaluators: serverTrustPolicies)
        self.sessionManager = Session(configuration: URLSessionConfiguration.default, serverTrustManager: wildcard)
    }
    
    func requestCharacterList(method: HTTPMethod = .get, parameters: Parameters? = nil, headers: HTTPHeaders? = nil, success: @escaping ([Character]) -> Void, failure: @escaping (String) -> Void) {
        sessionManager.request(baseUrl, method: method, parameters: parameters, encoding: URLEncoding.default, headers: headers)
            .response { resp in
                switch resp.result {
                case .success(let data):
                    guard let data = data else {
                        failure("No data received")
                        return
                    }
                    do {
                        let characterListResponse = try JSONDecoder().decode(CharacterListResponse.self, from: data)
                        success(characterListResponse.results)
                    } catch {
                        print("Error decoding character list: \(error.localizedDescription)")
                        failure("Error decoding character list")
                    }
                case .failure(let error):
                    print("Request error: \(error.localizedDescription)")
                    failure(error.localizedDescription)
                }
            }
    }


    
    func requestCharacterDetail(number: Int, method: HTTPMethod = .get, parameters: Parameters? = nil, headers: HTTPHeaders? = nil, success: @escaping (Character) -> Void, failure: @escaping (String) -> Void){
        let url = "\(baseUrl)\(number)/"
        sessionManager.request(url, method: method, parameters: parameters, encoding:
            URLEncoding.default, headers: headers)
            .response { resp in
                switch resp.result {
                case .success(let data):
                    do {
                        let character = try JSONDecoder().decode(Character.self, from: data ?? Data())
                        print(character)
                        success(character)
                    }catch{
                        print("error descodificar")
                    }
                case .failure(let error):
                    print(error)
                    failure(error.localizedDescription)
                }
            }
    }
    
}
