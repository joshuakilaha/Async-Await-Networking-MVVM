//
//  CharacterService.swift
//  API Async
//
//  Created by mroot on 28/04/2022.
//

import Foundation

struct CharacterService {
    
//constants for Errors that might occur in the Network request process
    enum NetworkError: Error {
        case failed
        case failedToDecode
        case invalidStatusCode
    }
    
    //MARK: GET Request for API
    func fetchCharacters() async throws -> [Character] {
        
        //assign URL if not throw an Error!
        guard let url = URL(string: APIConstants.baseURL) else {
            throw NetworkError.failed
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        //get the status report from server
        guard let response = response as? HTTPURLResponse,
              response.statusCode == 200 else {
            throw NetworkError.invalidStatusCode
        }
        
        //get the JSON data, decode and place the decoded info in the results
        let decoded = try JSONDecoder().decode(CharacterServiceResult.self, from: data)
        return decoded.results
    }
}
