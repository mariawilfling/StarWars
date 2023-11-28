//
//  MenuView.swift
//  StartWars
//
//  Created by Maria Wilfling on 21.11.23.
//

import SwiftUI

enum SWContentType: String {
    case films
    case people
    case planets
    case species
    case starships
    case vehicles
}

struct MenuView: View {
    
    init() {
        setListColors()
    }
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.black
                    .edgesIgnoringSafeArea([.top, .bottom])
                
                VStack {
                    
                    Image("SW_logo")
                        .resizable()
                        .scaledToFit()
                    
                    Spacer()
                    
                    Grid() {
                        GridRow {
                            NavigationLink(destination: FilmsListView(viewModel: FilmsListViewModel())) {
                                menuTile(contentType: .films)
                            }
                            menuTile(contentType: .people)
                        }
                        
                        GridRow {
                            menuTile(contentType: .planets)
                            menuTile(contentType: .species)
                        }
                        GridRow {
                            menuTile(contentType: .starships)
                            menuTile(contentType: .vehicles)
                        }
                    }
                    .padding()
                }
            }
        }
    }
}

func menuTile(contentType: SWContentType) -> some View {
    ZStack {
        Image("SW_\(contentType.rawValue)")
            .resizable()
            .scaledToFill()
            .frame(width: 150, height: 120)
        
        VStack {
            Spacer()
            
            Text("\(contentType.rawValue)")
                .padding(2)
                .frame(maxWidth: .infinity)
                .background(Color.black)
                .textCase(.uppercase)
                .foregroundColor(.yellow)
        }
        
    }
    .background(Color.black)
    .overlay(
        RoundedRectangle(cornerRadius: 15)
            .stroke(.yellow, lineWidth: 4)
    )
    .cornerRadius(15)
    .padding()
    
}

private func setListColors() {
    let coloredNavAppearance = UINavigationBarAppearance()
    coloredNavAppearance.configureWithOpaqueBackground()
    coloredNavAppearance.backgroundColor = .black
    coloredNavAppearance.titleTextAttributes = [.foregroundColor: UIColor.yellow]
    coloredNavAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.yellow]
           
    UINavigationBar.appearance().standardAppearance = coloredNavAppearance
    UINavigationBar.appearance().scrollEdgeAppearance = coloredNavAppearance
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView()
    }
}
