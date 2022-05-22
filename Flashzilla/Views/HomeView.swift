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
        Text("Hello, World!")
    }
}










struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .environmentObject(FlashzillaViewModel())
    }
}
