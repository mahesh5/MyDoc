//
//  PPRHomeDetailsPresenter.swift
//  MyDocTask
//
//  Created by mahesh.varadara on 14/1/20.
//  Copyright (c) 2020 mahesh.varadara. All rights reserved.
//

import Foundation

protocol PPHomeDetailsPresenterInput {
    func presentData()
    func display(_ error: Error?)
}

protocol PPHomeDetailsPresenterOutput: AnyObject {
    func display(with viewModel: PVMHomeDetailsViewModel)
}

final class PPRHomeDetailsPresenter {

    private(set) weak var output: PPHomeDetailsPresenterOutput?

    // MARK: - Initializers

    init(output: PPHomeDetailsPresenterOutput) {
        self.output = output
    }
}

// MARK: - PPHomeDetailsPresenterInput

extension PPRHomeDetailsPresenter: PPHomeDetailsPresenterInput {

    // MARK: - Presentation logic
    func showSpinner() {
    }

    func hideSpinner() {
    }

    func display(_ error: Error?) {
        let viewModel = PVMHomeDetailsViewModel()
        output?.display(with: viewModel)
    }

    func presentData() {

        let viewModel = PVMHomeDetailsViewModel()
        output?.display(with: viewModel)
    }
}
