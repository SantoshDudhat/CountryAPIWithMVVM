//
//  NationPopulation.swift
//  CountryAPIWithMVVM
//
//  Created by Santosh dudhat on 22/05/22.
//

import Foundation
struct NationPopulation: Codable {
    var detailsOfCountry: [Population]
    var source: [Source]
    private enum CodingKeys: String, CodingKey {
        case source
        case detailsOfCountry = "data"
    }
}
struct Population: Codable {
    var nationName: String
    var population: Double
    var whichYearData: String
    private enum CodingKeys: String, CodingKey {
        case population = "Population"
        case nationName = "Nation"
        case whichYearData = "Year"
    }
}
struct Source: Codable {
    var sourceDetails: SourceDetails
    private enum CodingKeys: String, CodingKey {
        case sourceDetails = "annotations"
    }
}

