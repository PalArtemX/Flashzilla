//
//  HomeView.swift
//  Flashzilla
//
//  Created by Artem Paliutin on 22/05/2022.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var vm: FlashzillaViewModel
    
    var body: some View {
        ZStack {
            Image("background")
                .resizable()
                .ignoresSafeArea()
            
            VStack {
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
            }
        }
    }
}










struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .environmentObject(FlashzillaViewModel())
            .previewInterfaceOrientation(.landscapeLeft)
    }
}
