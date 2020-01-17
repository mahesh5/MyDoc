//
//  PVMHomeViewModel.swift
//  MyDocTask
//
//  Created by mahesh.varadara on 10/1/20.
//  Copyright (c) 2020 mahesh.varadara. All rights reserved.
//

import Foundation
// Internal Model
struct Tracks {
    let count: Int?
    let tracks: [TracksList]?
}
struct TracksList {
    let artistName: String?
    let trackName: String?
    let trackImage: String?
    let collectionName : String?
    let releaseDate : String?
    let genere: String?
}
// ViewModel
struct PVMHomeViewModel {
    let count: Int?
    let tracks: [PVMTracks]?
}
struct PVMTracks {
    let artistName: String?
    let trackName: String?
    let trackImage: String?
    let collectionName : String?
    let releaseDate : String?
    let genere: String?
}
