//
//  Extensions.swift
//  StartWars
//
//  Created by Maria Wilfling on 23.11.23.
//

import Foundation

extension String {
    
    func extractId() -> Int? {
        let urlComponents = self.components(separatedBy: "/")
        let idString = urlComponents[urlComponents.count - 2]
        
        return Int(idString)
    }
}
