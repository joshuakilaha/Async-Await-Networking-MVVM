//
//  CharacterViewModel.swift
//  API Async
//
//  Created by mroot on 28/04/2022.
//

import Foundation


//To bind Array of character results to the view
@MainActor  //Publish any UI Updates to the MainThread
class CharacterViewModel: ObservableObject {
    
    //Constant States for the Views
    enum State {
        case notAvailable
        case loading
        case success(data: [Character])
        case failed(error: Error)
    }
    
    /**
     @private: Views to only access the state and not change it
     @.notAvailable: set to default since nothing has happen
     */
    @Published private(set) var state: State = .notAvailable //private
    @Published var hasError: Bool = false
    
    
    private let service: CharacterService
    
    init(service: CharacterService) {
        self.service = service
    }
    
    func getCharacters() async {
        //start loading
        self.state = .loading
        self.hasError = false
        
        do {
            let characters = try await service.fetchCharacters() //wait for response from fetchCharacters to continue
            self.state = .success(data: characters) //on success response get decoded info and place in characters
        } catch {
            //if the service.fetchCharacter func throws and error or fails to execute
            self.state = .failed(error: error)
            hasError = true
            debugPrint(error)
        }
    }
}
