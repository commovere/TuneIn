//
//  SectionElementModel.swift
//  TuneIn
//
//  Created by Andrii Andreiev on 23.12.2022.
//

import Foundation

struct SectionElementModel: AnyElementModel {
    var elementType: BodyElementType { .section }
    
    let text: String
    let children: [AnyElementModel]
}
