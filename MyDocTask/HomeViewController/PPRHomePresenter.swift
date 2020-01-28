//
//  PPRHomePresenter.swift
//  MyDocTask
//
//  Created by mahesh.varadara on 10/1/20.
//  Copyright (c) 2020 mahesh.varadara. All rights reserved.
//

import Foundation

protocol PPHomePresenterInput {
    func displayErrorMessage(message: String)
    func presentData(vm: Tracks)

}

protocol PPHomePresenterOutput: AnyObject {
    func displayPlayList(with viewModel: PVMHomeViewModel)
    func displayErrorMessage(message: String)
}

final class PPRHomePresenter {

    private(set) weak var output: PPHomePresenterOutput?

    // MARK: - Initializers

    init(output: PPHomePresenterOutput) {
        self.output = output
    }
}

// MARK: - PPHomePresenterInput

extension PPRHomePresenter: PPHomePresenterInput {
    // MARK: - Presentation logic
    func presentData(vm: Tracks) {
        var arrayTracks: [PVMTracks] = []
        let sortedTracks = sortTrackByName(tracks: vm.tracks)
        sortedTracks?.forEach { item in
            let date = item.releaseDate?.convertToDate()
            let viewModel = PVMTracks(artistName: item.artistName,
                                      trackName: item.trackName ?? PCString.blank,
                                      trackImage: item.trackImage,
                                      collectionName: item.collectionName,
                                      releaseDate: "\(PCString.releaseDate)\(date?.getDateString() ?? PCString.blank)",
                                      genere: "\(PCString.genere)\(item.genere ?? PCString.blank)")
            arrayTracks.append(viewModel)
        }
        let mapVM = PVMHomeViewModel(count: vm.count, tracks: arrayTracks)
        output?.displayPlayList(with: mapVM)
    }
    // Error Message
    func displayErrorMessage(message: String) {
        output?.displayErrorMessage(message: message)
    }
    // Sort Track by name
    func sortTrackByName(tracks: [TracksList]?) -> [TracksList]? {
        return tracks?.sorted { ($0.trackName ?? PCString.blank)
            .localizedStandardCompare($1.trackName ?? PCString.blank) == .orderedAscending
        }
    }
}
