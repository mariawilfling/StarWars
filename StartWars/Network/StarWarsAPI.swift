//
//  StarWarsAPI.swift
//  StartWars
//
//  Created by Maria Wilfling on 21.11.23.
//

import Moya

public enum StarWarsAPI {
    case films
    case people
    case personFromID(Int)
    case planets
    case species
    case starships
    case vehicles
}

extension StarWarsAPI: TargetType {
    public var baseURL: URL {
        return URL(string: "https://swapi.dev/api/")!
    }
    
    public var path: String {
        switch self {
        case .films: return "films"
        case .personFromID(let id): return "/people/\(id)/"
        case .people: return "people"
        case .planets: return "planets"
        case .species: return "species"
        case .starships: return "starships"
        case .vehicles: return "vehicles"
        }
    }
    
    public var method: Method {
        return .get
    }
    
    public var sampleData: Data {
        return Data()
    }
    
    public var task: Task {
        return .requestPlain
    }
    
    public var headers: [String : String]? {
        return ["Content-Type": "application/json"]
    }
    
    public var validationType: ValidationType {
        return .successCodes
    }
}
