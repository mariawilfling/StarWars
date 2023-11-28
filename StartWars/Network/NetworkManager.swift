//
//  NetworkManager.swift
//  StartWars
//
//  Created by Maria Wilfling on 21.11.23.
//

import Foundation
import Moya

protocol Networkable {
    
    var provider: MoyaProvider<StarWarsAPI> {get}
    
    func fetchFilmsData(completion: @escaping (Result<SWFilmsResponse, Error>) -> ())

}

struct NetworkManager: Networkable {
    
    var provider = MoyaProvider<StarWarsAPI>()
    
    func fetchFilmsData(completion: @escaping (Result<SWFilmsResponse, Error>) -> ()) {
        request(target: .films, completion: completion)
    }
    
    func fetchPeopleData(completion: @escaping (Result<SWPeopleResponse, Error>) -> ()) {
        request(target: .people, completion: completion)
    }
    
    func fetchPersonFromId(id: Int, completion: @escaping (Result<SWPeople, Error>) -> ()) {
        request(target: .personFromID(id), completion: completion)
    }
}

private extension NetworkManager {
    private func request<T: Decodable>(target: StarWarsAPI, completion: @escaping (Result<T, Error>) -> ()) {
        provider.request(target) { result in
            switch result {
            case let .success(response):
                do {
                    let results = try JSONDecoder().decode(T.self, from: response.data)
                    completion(.success(results))
                } catch let error {
                    completion(.failure(error))
                }
            case let .failure(error):
                completion(.failure(error))
            }
        }
    }
    
}
