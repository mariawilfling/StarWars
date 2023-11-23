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
    
    var allFilms = Dictionary<Int, SWFilm>()
    var allPeople = Dictionary<Int, SWPeople>()
    
    private init() {}
    
    func addFilms(filmData: SWFilmsResponse) {
        guard allFilms.isEmpty else {return}
        for film in filmData.results {
            if let id = idFrom(url: film.url) {
                allFilms[id] = film
            }
        }
    }
    
    func addPeople(peopleData: SWPeopleResponse) {
        guard allPeople.isEmpty else {return}
        for person in peopleData.results {
            if let id = idFrom(url: person.url)
                allPeople[id] = person
        }
    }
    
    func idFrom(url: String) -> Int? {
        let urlComponents = url.components(separatedBy: "/")
        let idString = urlComponents[urlComponents.count - 2]
        
        return Int(idString)
    }
    
}
