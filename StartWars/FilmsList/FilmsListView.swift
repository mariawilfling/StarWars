//
//  SWListView.swift
//  StartWars
//
//  Created by Maria Wilfling on 21.11.23.
//

import SwiftUI

struct FilmsListView: View {
    
    @ObservedObject var viewModel = FilmsListViewModel()
    
    init() {
        let coloredNavAppearance = UINavigationBarAppearance()
        coloredNavAppearance.configureWithOpaqueBackground()
        coloredNavAppearance.backgroundColor = .black
        coloredNavAppearance.titleTextAttributes = [.foregroundColor: UIColor.yellow]
        coloredNavAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.yellow]
        
        UINavigationBar.appearance().standardAppearance = coloredNavAppearance
        UINavigationBar.appearance().scrollEdgeAppearance = coloredNavAppearance
    }
    
    var body: some View {
        NavigationStack {
            
            ZStack {
                Color.black
                
                List {
                    ForEach(viewModel.films) { film in
                        NavigationLink(value: film) {
                            filmRow(film)
                        }
                        .listRowBackground(Color.black)
                    }
                }
                .scrollContentBackground(.hidden)
                .listStyle(.plain)
                .navigationDestination(for: Film.self, destination: { film in
                    SWFilmDetailView(film: film)
                })
                
                ProgressView("Loading...")
                    .foregroundColor(.white)
                    .opacity(viewModel.films.isEmpty ? 1 : 0)
                    
            }
            
            .navigationTitle("Films")
        }
    }
    
    func filmRow(_ film : Film) -> some View {
        HStack {
            VStack(alignment: .leading) {
                Text("\(film.title) (\(film.releaseDate))")
                    .foregroundColor(.yellow)
                    .font(Font.system(size: 15))
                    .bold()
                Text("Episode: \(film.episodeId)")
                    .foregroundColor(.yellow)
                    .font(Font.system(size: 12))
            }
            Spacer()
        }
        
    }
}

struct SWFilmsListView_Previews: PreviewProvider {
    static var previews: some View {
        FilmsListView()
    }
}
