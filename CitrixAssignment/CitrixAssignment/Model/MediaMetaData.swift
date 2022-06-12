//
//  MediaMetaData.swift
//  CitrixAssignment
//
//  Created by Stanly Johnson on 10/06/22.
//

import Foundation
struct MediaMetaData : Codable {
    let url : String?
    let format : String?
    let height : Int?
    let width : Int?

    enum CodingKeys: String, CodingKey {

        case url = "url"
        case format = "format"
        case height = "height"
        case width = "width"
    }
}
