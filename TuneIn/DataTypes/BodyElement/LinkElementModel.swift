//
//  LinkElementModel.swift
//  TuneIn
//
//  Created by Andrii Andreiev on 23.12.2022.
//

import Foundation

struct LinkElementModel: AnyElementModel {
    var elementType: BodyElementType { .link }

    let text:String
    let url: String
}
