//
//  CommonResponse.swift
//  TuneIn
//
//  Created by Andrii Andreiev on 23.12.2022.
//

import Foundation

typealias ResponseBody = [CommonElementModel]
struct CommonResponse: Decodable {
    let head: ResponseHead
    let body: ResponseBody
}

struct ResponseHead: Decodable {
    let title: String?
    let status: String
}

struct CommonElementModel: Decodable {
    let type: BodyElementType?
    let text: String
    let subtext: String?
    let image: String?
    let bitrate: String?
    let formats: String?
    let children: [CommonElementModel]?
    
    let url: String?
    
    enum CodingKeys: String, CodingKey {
        case type, text, subtext, image, bitrate, formats, children
        case url = "URL"
        
    }
}

enum BodyElementType: String, Decodable {
    case audio
    case link
    case section
    case text
    case unknown
}
