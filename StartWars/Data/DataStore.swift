//
//  DataStore.swift
//  StartWars
//
//  Created by Maria Wilfling on 22.11.23.
//

import Foundation

class DataStore {
    
    static let sharedInstance: DataStore = {
        let instance = DataStore()
        return instance
    }()
    
    var allFilms = Dictionary<Int, Film>()
    var allPeople = Dictionary<Int, People>()
    
    private init() {}
    
    func addFilms(filmData: SWFilmsResponse) {
        guard allFilms.isEmpty else {return}
        for film in filmData.results {
            if let id = film.url.extractId() {
                let newFilm = Film(url: film.url, title: film.title, episodeId: film.episodeId, releaseDate: film.releaseDate, characters: film.characters, planets: film.planets)
                allFilms[id] = newFilm
            }
        }
    }
    
    func addPeople(peopleData: SWPeopleResponse) {
        guard allPeople.isEmpty else {return}
        for person in peopleData.results {
            addPerson(personData: person)
        }
    }
    
    func addPerson(personData: SWPeople) {
        if let id = personData.url.extractId() {
            let newPerson = People(url: personData.url, name: personData.name, height: personData.height, mass: personData.mass, gender: personData.gender, homeworld: personData.homeworld, films: personData.films, species: personData.species, vehicles: personData.vehicles, starships: personData.starships)
            allPeople[id] = newPerson
        }
    }
    
    func getPeopleInFilm(_ film: Film) -> [People]? {
        guard let characters = film.characters else {return nil}
    
        var ids = [Int]()
        for personUrl in characters {
            if let id = personUrl.extractId() {
                ids.append(id)
            }
        }
        var peopleInFilm = [People]()
        for id in ids {
            if let person = allPeople[id] {
                peopleInFilm.append(person)
            }
        }
        
        return peopleInFilm
    }
}
