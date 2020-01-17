//
//  PMHomeRealmModels.swift
//  MyDocTask
//
//  Created by mahesh.varadara on 13/1/20.
//  Copyright © 2020 mahesh.varadara. All rights reserved.
//

import Foundation
import RealmSwift
import Realm

@objcMembers class StoredPlayList: Object, Decodable {
    dynamic var id = 0
    dynamic var count: Int = 0
    var playlists = RealmSwift.List<StoredTracks>()
    
    enum CodingKeys: String, CodingKey {
        case id
        case count
        case playlists
    }
    
    required init(from decoder: Decoder) throws
    {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        id = try container.decode(Int.self, forKey: .id)
        count = try container.decode(Int.self, forKey: .count)
        let playlistList = try container.decode([StoredTracks].self, forKey: .playlists)
        playlists.append(objectsIn: playlistList)
        
        super.init()
    }
    
    override static func primaryKey() -> String?
    {
        return "id"
    }
    
    required init()
    {
        super.init()
    }
}
@objcMembers class StoredTracks: Object, Decodable {
    dynamic var id = 0
    dynamic var artistType: String? = nil
    dynamic var artistName: String = ""
    dynamic var artistLinkUrl: String = ""
    dynamic var artistId: Int = 0
    dynamic var amgArtistId: Int = 0
    dynamic var previewUrl: String?
    dynamic var trackName : String?
    dynamic var collectionName : String?
    dynamic var releaseDate : String?

    
    enum CodingKeys: String, CodingKey {
        case id
        case artistType
        case artistName
        case artistLinkUrl
        case artistId
        case amgArtistId
        case previewUrl
        case trackPrice
        case trackName
        case collectionName
        case releaseDate
        case collectionPrice

    }
    
    required init(from decoder: Decoder) throws
    {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        id = try container.decode(Int.self, forKey: .id)
        artistType = try? container.decode(String.self, forKey: .artistType)
        artistName = try container.decode(String.self, forKey: .artistName)
        artistLinkUrl = try container.decode(String.self, forKey: .artistLinkUrl)
        artistId = try container.decode(Int.self, forKey: .artistId)
        amgArtistId = try container.decode(Int.self, forKey: .amgArtistId)
        previewUrl = try container.decodeIfPresent(String.self, forKey: .previewUrl)
        trackName = try container.decodeIfPresent(String.self, forKey: .trackName)
        collectionName = try container.decodeIfPresent(String.self, forKey: .collectionName)
        releaseDate = try container.decodeIfPresent(String.self, forKey: .releaseDate)
        super.init()
    }
    
    override static func primaryKey() -> String?
    {
        return "id"
    }
    
    required init()
    {
        super.init()
    }

}
