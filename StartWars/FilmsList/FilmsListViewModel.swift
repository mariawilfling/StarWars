//
//  FilmsListViewModel.swift
//  StartWars
//
//  Created by Maria Wilfling on 21.11.23.
//

import Foundation

class FilmsListViewModel: ObservableObject {
    
    @Published var films = [Film]()
    
    let dataManager = FilmDataManager()
    
    init() {
        self.films = films
        
        dataManager.delegate = self
        dataManager.fetchAllFilms()
    }
}

extension FilmsListViewModel: FilmDataManagerDelegate {

    func didFetchFilms(_ films: [Film]) {
        self.films = films
    }

    func didFailWithError(_: Error?) {

    }
}
