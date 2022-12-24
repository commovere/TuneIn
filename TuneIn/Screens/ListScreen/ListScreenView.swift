//
//  ListScreenView.swift
//  TuneIn
//
//  Created by Andrii Andreiev on 23.12.2022.
//

import SwiftUI

struct ListScreenView: View {
    var data: [AnyElementModel]
    var body: some View {
        List{
            ForEach(data.indices, id: \.self) { index in
                ListRowView(data[index])
            }
            Spacer()
        }
        .listRowInsets(.init(top: 0, leading: 0, bottom: 0, trailing: 0))
    }
}

struct ListScreenView_Previews: PreviewProvider {
    static var previews: some View {
        ListScreenView(data: [])
    }
}
