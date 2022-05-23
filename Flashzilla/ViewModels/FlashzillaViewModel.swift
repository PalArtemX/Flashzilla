//
//  FlashzillaViewModel.swift
//  Flashzilla
//
//  Created by Artem Paliutin on 22/05/2022.
//

import Foundation


class FlashzillaViewModel: ObservableObject {
    @Published private(set) var cards = Array(repeating: Card.example, count: 10)
    @Published private(set) var timeRemaining = 100
    @Published var isActive = true
    
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    
    // MARK: - Functions
    
    func removeCard(at index: Int) {
        cards.remove(at: index)
        if cards.isEmpty {
            isActive = false
        }
    }
    
    func timerMinusSecond() {
        timeRemaining -= 1
    }
    
    func resetCards() {
        cards = Array(repeating: Card.example, count: 10)
        timeRemaining = 100
        isActive = true
    }
}
