//
//  SourceDetails.swift
//  CountryAPIWithMVVM
//
//  Created by Santosh dudhat on 22/05/22.
//

import Foundation
struct SourceDetails: Codable {
    var sourceName: String
    var tableId: String
    var topic: String
    private enum CodingKeys: String, CodingKey {
        case topic
        case sourceName = "source_name"
        case tableId = "table_id"
    }
}
