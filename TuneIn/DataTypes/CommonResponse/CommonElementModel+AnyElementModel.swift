//
//  CommonElementModel+AnyElementModel.swift
//  TuneIn
//
//  Created by Andrii Andreiev on 23.12.2022.
//

import Foundation
extension CommonElementModel {
    var elementModel: AnyElementModel {
        if type == .link, let url = url {
            return LinkElementModel(text: text, url: url)
        }
        if type == .audio, let url = url {
            return AudioElementModel(text: text, url: url, image: image, subtext: subtext, bitrate: bitrate, formats: formats)
        }
        if type == nil, let children = children {
            return SectionElementModel(text: text, children: children.map{$0.elementModel})
        }
        return UnknownElementModel(text: text)
    }
}
