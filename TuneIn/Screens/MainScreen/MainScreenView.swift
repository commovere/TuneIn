//
//  MainScreenView.swift
//  TuneIn
//
//  Created by Andrii Andreiev on 23.12.2022.
//

import SwiftUI

struct MainScreenView: View {
    @ObservedObject private var observed = Observable()
    
    var body: some View {
        NavigationView {
            VStack {
                TopMenuView(observed.menu, selection: $observed.menuSelection)
                ListScreenView(data: observed.list)
                Spacer()
            }
            .navigationBarHidden(true)
        }
    }
}

struct MainScreenView_Previews: PreviewProvider {
    static var previews: some View {
        MainScreenView()
    }
}
