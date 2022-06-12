//
//  PopularNews.swift
//  CitrixAssignment
//
//  Created by Stanly Johnson on 10/06/22.
//

import Foundation
struct PopularNews : Codable {
    let status : String?
    let copyright : String?
    let num_results : Int?
    let results : [Results]?

    enum CodingKeys: String, CodingKey {

        case status = "status"
        case copyright = "copyright"
        case num_results = "num_results"
        case results = "results"
    }
}
