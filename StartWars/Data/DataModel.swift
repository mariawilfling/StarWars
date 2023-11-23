//
//  DataModel.swift
//  StartWars
//
//  Created by Maria Wilfling on 21.11.23.
//

import Foundation

enum Gender: String, Decodable {
    case male
    case female
}

struct SWFilmsResponse: Decodable {
    let results: [SWFilmResponse]
}

class SWFilmResponse: Codable {
    let url: String
    let title: String
    let episodeId: Int
    let releaseDate: String
    let characters: [String]
    let planets: [String]
    
    enum CodingKeys : String, CodingKey {
            case url, title, episodeId = "episode_id", releaseDate = "release_date", characters, planets
        }
    
    required init(from decoder:Decoder) throws {
            let values = try decoder.container(keyedBy: CodingKeys.self)
            url = try values.decode(String.self, forKey: .url)
            title = try values.decode(String.self, forKey: .title)
            episodeId = try values.decode(Int.self, forKey: .episodeId)
            releaseDate = try values.decode(String.self, forKey: .releaseDate)
            characters = try values.decode([String].self, forKey: .characters)
            planets = try values.decode([String].self, forKey: .planets)
        }
}

struct SWPeopleResponse: Decodable {
    let results: [SWPeople]
}

struct SWPeople: Decodable {
    let url: Int
    let name: String
    let height: Int
    let mass: Int
    let gender: Gender
    let homeworld: String
    let films: [String]
    let species: [String]
    let vehicles: [String]
    let starships: [String]
}

struct SWPlanets: Decodable {
    
}

struct SWSpecies: Decodable {
    
}
