//
//  CharacterServiceResult.swift
//  API Async
//
//  Created by mroot on 28/04/2022.
//

import Foundation

//JSON Data example
/**
 {
 "results": [
     {
         "id": 1,
         "name": "Rick Sanchez",
         "status": "Alive",
         "species": "Human",
         "type": "",
         "gender": "Male",
         "origin": {
         "name": "Earth (C-137)",
         "url": "https://rickandmortyapi.com/api/location/1"
     },
     "location": {
         "name": "Citadel of Ricks",
         "url": "https://rickandmortyapi.com/api/location/3"
     },
     "image": "https://rickandmortyapi.com/api/character/avatar/1.jpeg",
     "episode": [
         "https://rickandmortyapi.com/api/episode/1",
         "https://rickandmortyapi.com/api/episode/2",
     ],
     "url": "https://rickandmortyapi.com/api/character/1",
     "created": "2017-11-04T18:48:46.250Z"
     },
 ]
 }
 */

struct CharacterServiceResult: Codable {
    let results: [Character]
}

struct Character: Codable {
    let id: Int
    let name: String
    let status: Status
    let image: String
}

enum Status: String, Codable {
    case alive = "Alive"
    case dead = "Dead"
    case unKnown = "unknown"
}
