//
//  SWFilmDetailView.swift
//  StartWars
//
//  Created by Maria Wilfling on 22.11.23.
//

import SwiftUI

struct FilmDetailView: View {
    
    @ObservedObject var viewModel: FilmDetailViewModel
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(viewModel.film.title)
                .bold()
                .font(.system(size: 25))
            Text(viewModel.film.releaseDate)
            Text("Episode: \(viewModel.film.episodeId)")
                .padding(.bottom, 20)
            
            Text("Characters:")
                .bold()
            VStack {
                ForEach(viewModel.people) { person in
                    Text(person.name)
                }
                
                ProgressView("Loading...")
                    .opacity(viewModel.people.isEmpty ? 1 : 0)
            }
        }
        .padding()
    }
}

struct SWFilmDetailView_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = FilmDetailViewModel(film: Film.example)
        FilmDetailView(viewModel: viewModel)
    }
}
