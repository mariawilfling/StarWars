//
//  FilmDetailViewModel.swift
//  StartWars
//
//  Created by Maria Wilfling on 23.11.23.
//

import Foundation

class FilmDetailViewModel: ObservableObject {
    
    @Published var film: Film
    @Published var people = [People]()
    
    let dataManager = PeopleDataManager()
    
    init(film: Film) {
        self.film = film
        
        dataManager.delegate = self
        dataManager.fetchPeopleForFilm(film)
    }
}

extension FilmDetailViewModel: PeopleDataManagerDelegate {
    func didFetchPeopleForFilm(_ film: Film, people: [People]?) {
        if let people {
            self.people = people
        }
    }
    
    func didFetchPeople(_ people: [People]) {
        
    }
    
    func didFailWithError(_: Error?) {
        
    }
}
