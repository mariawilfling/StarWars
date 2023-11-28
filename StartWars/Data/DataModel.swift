//
//  DataModel.swift
//  StartWars
//
//  Created by Maria Wilfling on 21.11.23.
//

import Foundation

struct Film: Hashable, Identifiable {
    let id = UUID()
    let url: String
    let title: String
    let episodeId: Int
    let releaseDate: String
    let characters: [String]?
    let planets: [String]?
    
    #if DEBUG
    static let example = Film(url: "https://swapi.dev/api/films/1/", title: "A New Hope", episodeId: 4, releaseDate: "1977-05-25", characters: nil, planets: nil)
    #endif
}
struct People: Hashable, Identifiable {
    let id = UUID()
    let url: String
    let name: String
    let height: String
    let mass: String
    let gender: Gender
    let homeworld: String
    let films: [String]?
    let species: [String]?
    let vehicles: [String]?
    let starships: [String]?
    
    #if DEBUG
    static let example = People(url: "https://swapi.dev/api/films/1/", name: "Luke Skywalker", height: "174", mass: "70", gender: .male, homeworld: "xyz/url/1/", films: nil, species: nil, vehicles: nil, starships: nil)
    #endif
}
