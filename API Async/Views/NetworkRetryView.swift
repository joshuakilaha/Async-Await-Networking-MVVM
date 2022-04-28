//
//  NetworkRetryView.swift
//  API Async
//
//  Created by mroot on 28/04/2022.
//

import SwiftUI

struct NetworkRetryView: View {
    
    @StateObject private var viewModel = CharacterViewModel(service: CharacterService())
    
    let netStatus: String
    let image: String
    
    var body: some View {
        HStack {
            Text(netStatus)
                .padding()
            Image(systemName: image)
            
            Spacer()
            
            Button {
                Task {
                    await viewModel.getCharacters()
                }
            } label: {
                Text("Retry")
                    .padding()
                    .font(.headline)
                    .foregroundColor(Color(.systemBlue))
            }
            .frame(width: 80, height: 25)
            .background(Color.white)
            .clipShape(Capsule())
            .padding()

        }
        .background(Color.red)
    }
}

struct NetworkRetryView_Previews: PreviewProvider {
    static var previews: some View {
        NetworkRetryView(netStatus: "Not Connected", image: "morty")
    }
}
