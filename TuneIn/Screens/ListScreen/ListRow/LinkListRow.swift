//
//  LinkListRow.swift
//  TuneIn
//
//  Created by Andrii Andreiev on 23.12.2022.
//

import SwiftUI

struct LinkListRow: View {
    let data: LinkElementModel
    
    init(_ data: LinkElementModel){
        self.data = data
    }
    
    var body: some View {
        Text(data.text).font(.title3)
            .lineLimit(1)
    }
}

struct LinkListRow_Previews: PreviewProvider {
    static var previews: some View {
        List {
            LinkListRow(.init(text: "Some Title", url: "https://some.link.com"))
            LinkListRow(.init(text: "Some Title", url: "https://some.link.com"))
        }
    }
}
