//
//  LinkDetailsScreen.swift
//  TuneIn
//
//  Created by Andrii Andreiev on 24.12.2022.
//

import SwiftUI

struct LinkDetailsScreen: View {
    private var observed: Observable
    
    init(_ url: String){
        self.observed = .init(url)
    }
    
    var body: some View {
        ListScreenView(data: observed.list)
    }
}

struct LinkDetailsScreen_Previews: PreviewProvider {
    static var previews: some View {
        LinkDetailsScreen("")
    }
}
