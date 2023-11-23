//
//  FilmsListViewModel.swift
//  StartWars
//
//  Created by Maria Wilfling on 21.11.23.
//

import Foundation

final class FilmsListViewModel: ObservableObject {
    
    @Published var films =  [Film]()
    let dataManager = SWDataManager()

    
    init() {
        
        dataManager.delegate = self
        dataManager.getAllFilms()
    }
}

extension FilmsListViewModel: SWDataManagerDelegate {
    func didFetchFilms(films: [Film]) {
        self.films = films
    }
    
    func didFailWithError(_: Error?) {
        
    }
    
    
}
