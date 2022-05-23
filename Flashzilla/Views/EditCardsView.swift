//
//  EditCardsView.swift
//  Flashzilla
//
//  Created by Artem Paliutin on 23/05/2022.
//

import SwiftUI

struct EditCardsView: View {
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var vm: FlashzillaViewModel
    
    var body: some View {
        NavigationView {
            List {
                Section("Add new card") {
                    TextField("Prompt", text: $vm.newPrompt)
                    TextField("Answer", text: $vm.newAnswer)
                    Button {
                        vm.addCard()
                    } label: {
                        Label("Add card", systemImage: "plus.circle")
                            .symbolRenderingMode(.hierarchical)
                    }
                }
                
                Section {
                    ForEach(0..<vm.cards.count, id: \.self) { index in
                        VStack(alignment: .leading) {
                            Text(vm.cards[index].prompt)
                                .font(.headline)
                            Text(vm.cards[index].answer)
                                .foregroundColor(.secondary)
                        }
                    }
                    .onDelete(perform: vm.removeCards)
                }
            }
            .navigationTitle("Edit Cards")
            .toolbar {
                Button {
                    dismiss()
                } label: {
                    Label("Done", systemImage: "checkmark.circle")
                        .symbolRenderingMode(.hierarchical)
                        .font(.title3.bold())
                }
            }
            .listStyle(.grouped)
            .onAppear(perform: vm.loadData)
        }
    }
}










struct EditCardsView_Previews: PreviewProvider {
    static var previews: some View {
        EditCardsView()
            .environmentObject(FlashzillaViewModel())
    }
}
