//
//  TopMenuView.swift
//  TuneIn
//
//  Created by Andrii Andreiev on 23.12.2022.
//

import SwiftUI

struct TopMenuView: View {
    //It is better to use @StateObject for links, butfor this app menu will not be reloaded
    let links: [LinkElementModel]
    @Binding var selectedIndex: Int
    
    init(_ links: [LinkElementModel], selection: Binding<Int>) {
        self.links = links
        _selectedIndex = selection
    }

    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(links.indices, id: \.self) { index in
                    TopMenuItem(title: links[index].text, selected: index == selectedIndex)
                        .onTapGesture { [index] in
                            selectedIndex = index
                        }
                }
            }
        }
    }
}

struct TopMenuView_Previews: PreviewProvider {
    static var previews: some View {
        TopMenuView(
            [
                .init(text: "Title 1", url: "http://some.url.com"),
                .init(text: "Title 2", url: "http://some.url.com"),
                .init(text: "Title 3", url: "http://some.url.com"),
                .init(text: "Title 4", url: "http://some.url.com")
            ],
            selection: .constant(0)
        )
    }
}
