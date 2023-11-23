//
//  SWFilmDetailView.swift
//  StartWars
//
//  Created by Maria Wilfling on 22.11.23.
//

import SwiftUI

struct FilmDetailView: View {
    
    let film: Film
    
    var body: some View {
        VStack {
            Text(film.title)
            Text(film.releaseDate)
            Text("\(film.episodeId)")
        }
        
    }
}

struct SWFilmDetailView_Previews: PreviewProvider {
    static var previews: some View {
        FilmDetailView(film: Film.example)
    }
}
