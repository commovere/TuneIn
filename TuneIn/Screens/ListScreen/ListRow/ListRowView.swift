//
//  ListRowView.swift
//  TuneIn
//
//  Created by Andrii Andreiev on 23.12.2022.
//

import SwiftUI

struct ListRowView: View {
    let data: AnyElementModel
    
    init(_ data: AnyElementModel){
        self.data = data
    }

    var body: some View {
        if let audioModel = data as? AudioElementModel {
            NavigationLink(destination: { AudioDetailsScreen(audioModel) } ) {
                AudioListRow(audioModel)
            }
        } else if let linkModel = data as? LinkElementModel {
            NavigationLink(destination: { LinkDetailsScreen(linkModel.url) } ) {
               LinkListRow(linkModel)
            }
        } else if data.elementType == .section, let sectionModel = data as? SectionElementModel {
            Section(sectionModel.text){
                ForEach(sectionModel.children.indices, id: \.self) { index in
                    ListRowView(sectionModel.children[index])
                }
            }
        } else {
            Text("\(data.elementType.rawValue): \(data.text)")
        }
    }
}

struct ListRowView_Previews: PreviewProvider {
    static var previews: some View {
        ListRowView(UnknownElementModel(text: "some text"))
    }
}
