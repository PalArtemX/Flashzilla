//
//  HomeView.swift
//  Flashzilla
//
//  Created by Artem Paliutin on 22/05/2022.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var vm: FlashzillaViewModel
    @Environment(\.scenePhase) var scenePhase
    
    var body: some View {
        ZStack {
            Image("background")
                .resizable()
                .ignoresSafeArea()
            
            VStack {
                TimerView()
                
                CardStackView()
                
                if vm.cards.isEmpty {
                    Button("Start Again", action: vm.resetCards)
                        .padding()
                        .buttonStyle(.borderedProminent)
                }
            }
        }
        .onReceive(vm.timer) { time in
            guard vm.isActive else { return }
            if vm.timeRemaining > 0 {
                vm.timerMinusSecond()
            }
        }
        .onChange(of: scenePhase) { newPhase in
            if newPhase == .active {
                if !vm.cards.isEmpty {
                    vm.isActive = true
                }
            } else {
                vm.isActive = false
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
