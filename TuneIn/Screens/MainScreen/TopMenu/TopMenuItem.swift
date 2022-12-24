//
//  TopMenuItem.swift
//  TuneIn
//
//  Created by Andrii Andreiev on 23.12.2022.
//

import SwiftUI

struct TopMenuItem: View {
    let title: String
    var selected: Bool

    var body: some View {
        Text(title)
            .underline(selected, color: .red)
            .font(.title2)
            .fontWeight(.bold)
            .padding(10)
            .foregroundColor(.black)
    }
}

struct TopMenuItem_Previews: PreviewProvider {
    static var previews: some View {
        HStack {
            TopMenuItem(title: "Title 1", selected: true)
            TopMenuItem(title: "Title 2", selected: false)
            TopMenuItem(title: "Title 3", selected: false)
        }
        
    }
}
