//
//  AnyElementModel.swift
//  TuneIn
//
//  Created by Andrii Andreiev on 23.12.2022.
//

import Foundation

protocol AnyElementModel {
    var elementType: BodyElementType { get }
    var text: String { get }
}
