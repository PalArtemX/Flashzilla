//
//  FlashzillaApp.swift
//  Flashzilla
//
//  Created by Artem Paliutin on 22/05/2022.
//

import SwiftUI

@main
struct FlashzillaApp: App {
    @StateObject var flashzillaViewModel = FlashzillaViewModel()
    
    var body: some Scene {
        WindowGroup {
            HomeView()
                .environmentObject(flashzillaViewModel)
        }
    }
}
