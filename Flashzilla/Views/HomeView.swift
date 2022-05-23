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
    @State private var showingEditScreen = false
    
    var body: some View {
        ZStack {
            Image("background")
                .resizable()
                .ignoresSafeArea()
            
            VStack {
                TimerView()
                
                CardsStackView()
                
                if vm.cards.isEmpty {
                    Button("Start Again", action: vm.resetCards)
                        .buttonStyle(.borderedProminent)
                }
            }
            VStack {
                HStack {
                    Spacer()
                    Button {
                        showingEditScreen.toggle()
                    } label: {
                        Image(systemName: "plus.circle")
                            .font(.largeTitle)
                            .foregroundColor(.white)
                            .symbolRenderingMode(.hierarchical)
                            .padding()
                    }

                }
                Spacer()
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
        .sheet(isPresented: $showingEditScreen, onDismiss: vm.resetCards) {
            EditCardsView()
        }
        .onAppear(perform: vm.resetCards)
    }
}










struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .environmentObject(FlashzillaViewModel())
            .previewInterfaceOrientation(.landscapeLeft)
    }
}
