//
//  DataManager.swift
//  StartWars
//
//  Created by Maria Wilfling on 22.11.23.
//

import Foundation

protocol FilmDataManagerDelegate {
    
    func didFetchFilms(_ films : [Film])
    func didFailWithError(_: Error?)
}

class FilmDataManager {
    
    private var dataStore = DataStore.sharedInstance
    private let networkManager = NetworkManager()
    
    var delegate: FilmDataManagerDelegate?
    
    func fetchAllFilms() {
        networkManager.fetchFilmsData { [weak self] result in
            
            guard let strongSelf = self else { return }
            
            switch result {
            case .success(let filmResponse):
                strongSelf.dataStore.addFilms(filmData: filmResponse)
                let films = Array(strongSelf.dataStore.allFilms.values)
                strongSelf.delegate?.didFetchFilms(films)
                
            case .failure(let error):
                strongSelf.delegate?.didFailWithError(error)
            }
        }
    }
    
    
        
    }

