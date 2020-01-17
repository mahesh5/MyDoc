//
//  PCRHomeDetailsConfigurator.swift
//  MyDocTask
//
//  Created by mahesh.varadara on 14/1/20.
//  Copyright (c) 2020 mahesh.varadara. All rights reserved.
//

import Foundation
import UIKit

final class PCRHomeDetailsConfigurator: PPBaseConfig {
   

    // MARK: - Singleton

    static let sharedInstance: PCRHomeDetailsConfigurator = PCRHomeDetailsConfigurator()

    // MARK: - Configuration

    func configure(viewController: UIViewController)  {

        if let viewControllerUW = viewController as? PIHomeDetailsViewController {

            let router = PRUHomeDetailsRouter(viewController: viewControllerUW)
            let presenter = PPRHomeDetailsPresenter(output: viewControllerUW)
            let interactor = PINHomeDetailsInteractor(output: presenter)
            viewControllerUW.output = interactor
            viewControllerUW.router = router
        }
    }
}
final class PCRHomeDetailsConfiguratorInit: PPBaseConfig {

    var tracksDetail: PVMTracks?
    init(tracksDetail: PVMTracks?) {
        self.tracksDetail = tracksDetail
    }
    // MARK: - Configuration
    func configure(viewController: UIViewController)  {

        if let viewControllerUW = viewController as? PIHomeDetailsViewController {

            let router = PRUHomeDetailsRouter(viewController: viewControllerUW)
            let presenter = PPRHomeDetailsPresenter(output: viewControllerUW)
            let interactor = PINHomeDetailsInteractor(output: presenter)
            viewControllerUW.output = interactor
            viewControllerUW.router = router
            viewControllerUW.trackDetail = self.tracksDetail
        }
    }
}
