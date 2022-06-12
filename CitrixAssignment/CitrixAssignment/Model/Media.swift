//
//  Media.swift
//  CitrixAssignment
//
//  Created by Stanly Johnson on 10/06/22.
//

import Foundation
struct Media : Codable {
    let type : String?
    let subtype : String?
    let caption : String?
    let copyright : String?
    let approved_for_syndication : Int?
    let mediaMetadata : [MediaMetaData]?

    enum CodingKeys: String, CodingKey {

        case type = "type"
        case subtype = "subtype"
        case caption = "caption"
        case copyright = "copyright"
        case approved_for_syndication = "approved_for_syndication"
        case mediaMetadata = "media-metadata"
    }
    
}
