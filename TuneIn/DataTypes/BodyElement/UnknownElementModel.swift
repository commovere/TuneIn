//
//  UnknownElementModel.swift
//  TuneIn
//
//  Created by Andrii Andreiev on 23.12.2022.
//

import Foundation


struct UnknownElementModel: AnyElementModel {
    var elementType: BodyElementType { .unknown }

    let text:String
}
