//
//  ContentView.swift
//  API Async
//
//  Created by mroot on 28/04/2022.
//

import SwiftUI

struct ContentView: View {
    //WARNING Issue solved here: https://twitter.com/andresr_develop/status/1509287460961927186?s=21
    @StateObject private var viewModel = CharacterViewModel(service: CharacterService())
    @ObservedObject private var networkManager = NetworkManager()
    
    
    var body: some View {
        NavigationView {
                    switch viewModel.state {
                        
                    case .success(let data) :
                        
                        VStack {
                            List {
                                ForEach(data, id: \.id) { item in
                                    CharacterViewCell(name: item.name, status: item.status, images: item.image)
                                }
                            }
                            if networkManager.isConnected {
                                NetworkRetryView(netStatus: networkManager.connectionDescription, image: networkManager.imageName)
                            }
                        } .navigationTitle("Characters")
                        
                    case .notAvailable:
                        EmptyView()
                        
                    case .loading:
                        ProgressView()
                        
                    case .failed(error: let error):
                        Text(error.localizedDescription)
                    }
            
        } .task {
            await viewModel.getCharacters()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
