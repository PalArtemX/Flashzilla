//
//  CardStackView.swift
//  Flashzilla
//
//  Created by Artem Paliutin on 23/05/2022.
//

import SwiftUI

struct CardStackView: View {
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
            }
        }
        .allowsTightening(vm.timeRemaining > 0)
    }
}










struct CardStackView_Previews: PreviewProvider {
    static var previews: some View {
        CardStackView()
            .environmentObject(FlashzillaViewModel())
            .previewInterfaceOrientation(.landscapeLeft)
    }
}
