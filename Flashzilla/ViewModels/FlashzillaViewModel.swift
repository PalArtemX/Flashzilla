//
//  FlashzillaViewModel.swift
//  Flashzilla
//
//  Created by Artem Paliutin on 22/05/2022.
//

import Foundation


class FlashzillaViewModel: ObservableObject {
    @Published private(set) var cards = Array<Card>(repeating: Preview.card, count: 10)
    
    
    
    
    // MARK: - Functions
    
    // MARK: removeCard
    func removeCard(at index: Int) {
        cards.remove(at: index)
    }
}
