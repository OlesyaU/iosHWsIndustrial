//
//  FeedViewModel.swift
//  Navigation
//
//  Created by Олеся on 05.11.2022.
//

import Foundation

final class FeedViewModel {
    
    let model: FeedModelProtocol
    
    enum State {
        case initial
        case success
        case error
    }

    enum Action {
        case viewIsReady
        case buttonTapped
    }
    var stateChanged: ((State)-> Void)?
    var word: String?
    var result : Bool?
    
    init(model: FeedModelProtocol){
        self.model = model
    }
    
    private(set) var state: State = .initial {
        didSet {
            stateChanged?(state)
        }
    }
    
    func changeState(action: Action) {
        switch action {
            case .viewIsReady:
                state = .initial
            case .buttonTapped:
           guard let word = word else {return}
                result = model.check(word: word)
        }
    }
}
