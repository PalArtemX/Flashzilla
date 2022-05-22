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
        CardView(card: Preview.card)
    }
}










struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .environmentObject(FlashzillaViewModel())
            .previewInterfaceOrientation(.landscapeLeft)
    }
}
