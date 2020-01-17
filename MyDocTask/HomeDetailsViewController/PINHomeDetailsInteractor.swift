//
//  PINHomeDetailsInteractor.swift
//  MyDocTask
//
//  Created by mahesh.varadara on 14/1/20.
//  Copyright (c) 2020 mahesh.varadara. All rights reserved.
//

import Foundation

protocol PPHomeDetailsInteractorInput {

    func doSomething()
}

final class PINHomeDetailsInteractor {

    let output: PPHomeDetailsPresenterInput
    let apiWorker: PPHomeDetailsAPIWorker
    let bizWorker: PPHomeDetailsBLUWorker

    // MARK: - Initializers

    init(output: PPHomeDetailsPresenterInput,
         apiWorker: PPHomeDetailsAPIWorker = PWHomeDetailsAPIWorker(),
         bizWorker: PPHomeDetailsBLUWorker = PWHomeDetailsBLUWorker()) {

        self.output = output
        self.apiWorker = apiWorker
        self.bizWorker = bizWorker
    }
}

// MARK: - PPHomeDetailsInteractorInput

extension PINHomeDetailsInteractor: PPHomeDetailsInteractorInput {

    // MARK: - Business logic

    func doSomething() {
        bizWorker.processData()
        output.presentData()
    }
}
