//
//  PWHomeBLUWorker.swift
//  MyDocTask
//
//  Created by mahesh.varadara on 10/1/20.
//  Copyright (c) 2020 mahesh.varadara. All rights reserved.
//

import Foundation
import RealmSwift
import Realm
import Promises

protocol PPHomeBLUWorker {
    func savePlaylistToRealm(playList: Playlist)
    func mapRealmViewModel()->Tracks
}
class PWHomeBLUWorker: PPHomeBLUWorker {
    // MARK: - Save Playlist to Realm
    func savePlaylistToRealm(playList: Playlist) {
        let realm = try! Realm()
        print(Realm.Configuration.defaultConfiguration.fileURL!)
        let mapper = PVMRealmMapper()
        let track =  mapper.setPlaylist(data: playList)
        try! realm.write {
            let playlist = StoredPlayList()
            playlist.count = playList.resultCount ?? 0
            playlist.playlists = track
            realm.add(playlist, update: .all)
        }
    }
    // MARK: - Map Realm to Internal Model
     func mapRealmViewModel() -> Tracks {
         var arrayTracks: [TracksList] = []
         let realm = try! Realm()
         let datas = realm.objects(StoredPlayList.self)
         datas.first?.playlists.forEach { item in
             let model = TracksList(artistName: item.artistName,
                                    trackName: item.trackName,
                                    trackImage: item.artistLinkUrl,
                                    collectionName: item.collectionName,
                                    releaseDate: item.releaseDate,
                                    genere: item.artistType)
             arrayTracks.append(model)
         }
         let tracksModel = Tracks(count: datas.first?.count, tracks: arrayTracks)
         return tracksModel
     }
}


class PVMRealmMapper {
    func setPlaylist(data: Playlist) -> List<StoredTracks> {
        let values = RealmSwift.List<StoredTracks>()
        var index = 0
        data.results?.forEach { value in
            let items = StoredTracks()
            items.id = index
            items.artistId = value.artistId ?? 0
            items.artistLinkUrl = value.artworkUrl100 ?? PCString.blank
            items.artistType = value.primaryGenreName ?? PCString.blank
            items.artistName = value.artistName ?? PCString.blank
            items.collectionName = value.collectionName ?? PCString.blank
            items.releaseDate = value.releaseDate ?? PCString.blank
            items.trackName = value.trackName ?? PCString.blank
            let convert  = PHUtilHelper.shared.getDocumentDirectoryImagePath(imageURL: items.artistLinkUrl, index: index)
            items.artistLinkUrl = convert
            //Artist id doesn't have value.
            if value.amgArtistId == nil {
                values.append(items)
            }
            index += 1
        }
        return values
    }
}

