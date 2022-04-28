//
//  CharacterViewCell.swift
//  API Async
//
//  Created by mroot on 28/04/2022.
//

import SwiftUI

struct CharacterViewCell: View {
    
    let name: String
    let status: Status
    let images: String
    
    var body: some View {
        HStack {
            AsyncImage(url: URL(string: images)) { image in
                image.resizable()
            } placeholder: {
                ProgressView()
            } .frame(width: 90, height: 90)
            
            VStack(alignment: .leading) {
                Text(name)
                    .font(.title)
                Text(status.rawValue)
                        .font(.subheadline)
                        .foregroundColor(statusColor(status: status))
            }
        }
    }
    
    private func statusColor(status: Status) -> Color {
        switch status {
        case .alive:
            return .green
        case .dead:
            return .red
        case .unKnown:
            return .gray
        }
    }
}

struct CharacterViewCell_Previews: PreviewProvider {
    static var previews: some View {
        CharacterViewCell(name: "Rick", status: .alive, images: "morty")
    }
}
