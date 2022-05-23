//
//  TimerView.swift
//  Flashzilla
//
//  Created by Artem Paliutin on 23/05/2022.
//

import SwiftUI

struct TimerView: View {
    @EnvironmentObject var vm: FlashzillaViewModel
    
    var body: some View {
        Text("Time: \(vm.timeRemaining)")
            .font(.largeTitle)
            .foregroundColor(.white)
            .padding(.horizontal, 20)
            .padding(.vertical, 5)
            .background(.black.opacity(0.7))
            .clipShape(Capsule())
    }
}










struct TimerView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            TimerView()
                .previewLayout(.sizeThatFits)
                .environmentObject(FlashzillaViewModel())
        }
        .padding()
        .background(Image("background"))
    }
}
