//
//  FlashzillaViewModel.swift
//  Flashzilla
//
//  Created by Artem Paliutin on 22/05/2022.
//

import Foundation


class FlashzillaViewModel: ObservableObject {
    @Published private(set) var cards: [Card] = []
    @Published private(set) var timeRemaining = 100
    @Published var isActive = true
    @Published var newPrompt = ""
    @Published var newAnswer = ""
    
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
        timeRemaining = 100
        isActive = true
        loadData()
    }
    
    func loadData() {
        if let data = UserDefaults.standard.data(forKey: "Cards") {
            if let decoded = try? JSONDecoder().decode([Card].self, from: data) {
                DispatchQueue.main.async {
                    self.cards = decoded
                }
            }
        }
    }
    
    func saveData() {
        if let data = try? JSONEncoder().encode(cards) {
            DispatchQueue.main.async {
                UserDefaults.standard.set(data, forKey: "Cards")
            }
            
        }
    }
    
    func addCard() {
        let trimmedPrompt = newPrompt.trimmingCharacters(in: .whitespaces)
        let trimmedAnswer = newAnswer.trimmingCharacters(in: .whitespaces)
        guard !trimmedPrompt.isEmpty && !trimmedAnswer.isEmpty else { return }
        let card = Card(prompt: trimmedPrompt, answer: trimmedAnswer)
        cards.insert(card, at: 0)
        saveData()
    }
    
    func removeCards(at offsets: IndexSet) {
        cards.remove(atOffsets: offsets)
        saveData()
    }
    
}
