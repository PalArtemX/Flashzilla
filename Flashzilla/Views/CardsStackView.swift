//
//  CardsStackView.swift
//  Flashzilla
//
//  Created by Artem Paliutin on 23/05/2022.
//

import SwiftUI

struct CardsStackView: View {
    @EnvironmentObject var vm: FlashzillaViewModel
    
    var body: some View {
        ZStack {
            ForEach(0..<vm.cards.count, id: \.self) { index in
                CardView(card: vm.cards[index]) {
                    withAnimation {
                        vm.removeCard(at: index)
                    }
                }
                .stacked(at: index, in: vm.cards.count)
                .allowsHitTesting(index == vm.cards.count - 1)
                .accessibilityHidden(index < vm.cards.count - 1)
            }
        }
        .allowsTightening(vm.timeRemaining > 0)
    }
}










struct CardStackView_Previews: PreviewProvider {
    static var previews: some View {
        CardsStackView()
            .environmentObject(FlashzillaViewModel())
            .previewInterfaceOrientation(.landscapeLeft)
    }
}
