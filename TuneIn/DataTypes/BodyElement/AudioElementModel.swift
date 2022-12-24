//
//  AudioElementModel.swift
//  TuneIn
//
//  Created by Andrii Andreiev on 23.12.2022.
//

import Foundation

struct AudioElementModel: AnyElementModel {
    var elementType: BodyElementType { .audio }

    let text: String
    let url: String
    let image: String?
    let subtext: String?
    let bitrate: String?
    let formats: String?
}
