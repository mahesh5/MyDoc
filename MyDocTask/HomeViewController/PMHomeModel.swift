//
//  PMHomeModel.swift
//  MyDocTask
//
//  Created by mahesh.varadara on 10/1/20.
//  Copyright (c) 2020 mahesh.varadara. All rights reserved.
//

import Foundation

// MARK: - Playlist
struct Playlist : Codable {
    let resultCount : Int?
    let results : [Results]?
    enum CodingKeys: String, CodingKey {

        case resultCount = "resultCount"
        case results = "results"
    }
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        resultCount = try values.decodeIfPresent(Int.self, forKey: .resultCount)
        results = try values.decodeIfPresent([Results].self, forKey: .results)
    }
}


// MARK: - Result
struct Results : Codable {
    let artistType : String?
    let artistName : String?
    let artistLinkUrl : String?
    let artistId : Int?
    let amgArtistId : Int?
    let primaryGenreName : String?
    let artworkUrl100: String?
    let imageData: Data?
    let previewUrl: String?
    let trackName : String?
    let collectionName : String?
    let releaseDate : String?
    
    enum CodingKeys: String, CodingKey {
        case artistType = "artistType"
        case artistName = "artistName"
        case artistLinkUrl = "artistLinkUrl"
        case artistId = "artistId"
        case amgArtistId = "amgArtistId"
        case primaryGenreName = "primaryGenreName"
        case artworkUrl100 = "artworkUrl100"
        case imageData = "imageData"
        case previewUrl = "previewUrl"
        case trackName = "trackName"
        case collectionName = "collectionName"
        case releaseDate = "releaseDate"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        artistType = try values.decodeIfPresent(String.self, forKey: .artistType)
        artistName = try values.decodeIfPresent(String.self, forKey: .artistName)
        artistLinkUrl = try values.decodeIfPresent(String.self, forKey: .artistLinkUrl)
        artistId = try values.decodeIfPresent(Int.self, forKey: .artistId)
        amgArtistId = try values.decodeIfPresent(Int.self, forKey: .amgArtistId)
        primaryGenreName = try values.decodeIfPresent(String.self, forKey: .primaryGenreName)
        artworkUrl100 = try values.decodeIfPresent(String.self, forKey: .artworkUrl100)
        imageData = try values.decodeIfPresent(Data.self, forKey: .imageData)
        previewUrl = try values.decodeIfPresent(String.self, forKey: .previewUrl)
        trackName = try values.decodeIfPresent(String.self, forKey: .trackName)
        collectionName = try values.decodeIfPresent(String.self, forKey: .collectionName)
        releaseDate = try values.decodeIfPresent(String.self, forKey: .releaseDate)
    }
}


