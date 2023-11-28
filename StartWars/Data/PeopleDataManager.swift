//
//  PeopleDataManager.swift
//  StartWars
//
//  Created by Maria Wilfling on 23.11.23.
//

import Foundation

protocol PeopleDataManagerDelegate {
    func didFetchPeople(_ people: [People])
    func didFetchPeopleForFilm(_ film: Film, people: [People]?)
    func didFailWithError(_: Error?)
}

class PeopleDataManager {
    
    private var dataStore = DataStore.sharedInstance
    private let networkManager = NetworkManager()
    private let peopleDataDispatchGroup = DispatchGroup()
    
    var delegate: PeopleDataManagerDelegate?
    
    func fetchAllPeople() {
        networkManager.fetchPeopleData { [weak self] result in
            
            guard let strongSelf = self else { return }
            
            switch result {
            case .success(let peopleResponse):
                strongSelf.dataStore.addPeople(peopleData: peopleResponse)
                let people = Array(strongSelf.dataStore.allPeople.values)
                strongSelf.delegate?.didFetchPeople(people)
                
            case .failure(let error):
                strongSelf.delegate?.didFailWithError(error)
            }
        }
    }
    
    func fetchPeopleForFilm(_ film: Film) {
        var ids = [Int]()

        guard let characters = film.characters else {return}
        for characterUrl in characters {
            if let id = characterUrl.extractId() {
                ids.append(id)
                
                /// In order to be able to show some data
                /// TODO: implement paging
                if ids.count == 10 {
                    break
                }
            }
        }
        
        fetchPeople(ids: ids, film: film)
    }
    
    func fetchPerson(id: Int) {
        networkManager.fetchPersonFromId(id: id) { [weak self] result in
            
            guard let strongSelf = self else { return }
            
            switch result {
            case .success(let person):
                strongSelf.dataStore.addPerson(personData: person)
                strongSelf.peopleDataDispatchGroup.leave()
            case .failure(let error):
                strongSelf.delegate?.didFailWithError(error)
            }
        }
    }
        
    private func fetchPeople(ids: [Int], film: Film) {
            for id in ids {
                peopleDataDispatchGroup.enter()
                fetchPerson(id: id)
            }
            
            peopleDataDispatchGroup.notify(queue: .main) {
                let people = self.dataStore.getPeopleInFilm(film)
                self.delegate?.didFetchPeopleForFilm(film, people: people)
            }
        }
}
