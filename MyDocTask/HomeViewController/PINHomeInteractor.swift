//
//  PINHomeInteractor.swift
//  MyDocTask
//
//  Created by mahesh.varadara on 10/1/20.
//  Copyright (c) 2020 mahesh.varadara. All rights reserved.
//

import Foundation
import Realm
import RealmSwift

protocol PPHomeInteractorInput {
    func getAllTracks()
}

final class PINHomeInteractor {

    let output: PPHomePresenterInput
    let apiWorker: PPHomeAPIWorker
    let bizWorker: PPHomeBLUWorker
    let reachability: PCHReachablity

    // MARK: - Initializers

    init(output: PPHomePresenterInput,
         apiWorker: PPHomeAPIWorker = PWHomeAPIWorker(),
         bizWorker: PPHomeBLUWorker = PWHomeBLUWorker(),
         reachability: PCHReachablity = PCHReachablity()) {

        self.output = output
        self.apiWorker = apiWorker
        self.bizWorker = bizWorker
        self.reachability = reachability
    }
}

// MARK: - PPHomeInteractorInput

extension PINHomeInteractor: PPHomeInteractorInput {
    
    // MARK: - Business logic
    func getAllTracks() {
        let realm = try! Realm()
        if realm.isEmpty {
            savePlayListToDB()
        } else {
            let viewModel = self.bizWorker.mapRealmViewModel()
            self.output.presentData(vm: viewModel)
        }
    }
    
    func savePlayListToDB() {
        if reachability.isInternetAvailable {
            PUProgressView.shared.showProgressView()
            let worker = apiWorker.getPlayList()
            worker
                .then {
                    data in
                    self.bizWorker.savePlaylistToRealm(playList: data)
                    let viewModel = self.bizWorker.mapRealmViewModel()
                    self.output.presentData(vm: viewModel)
                    PUProgressView.shared.hideProgressView()
            }.catch {_ in
                PUProgressView.shared.hideProgressView()
                self.output.displayErrorMessage(message: "Failed to load data from server.")
            }
        } else {
            self.output.displayErrorMessage(message: "No internet connection.")
        }
    }
}
