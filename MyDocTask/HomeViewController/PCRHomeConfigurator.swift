//
//  PCRHomeConfigurator.swift
//  MyDocTask
//
//  Created by mahesh.varadara on 10/1/20.
//  Copyright (c) 2020 mahesh.varadara. All rights reserved.
//

import Foundation
import UIKit


final class PCRHomeConfigurator: PPBaseConfig {

    // MARK: - Singleton

    static let sharedInstance: PCRHomeConfigurator = PCRHomeConfigurator()

    // MARK: - Configuration
    func configure(viewController: UIViewController)  {

        if let viewControllerUW = viewController as? PIHomeViewController {
            let router = PRUHomeRouter(viewController: viewControllerUW)
            let presenter = PPRHomePresenter(output: viewControllerUW)
            let interactor = PINHomeInteractor(output: presenter)
            viewControllerUW.output = interactor
            viewControllerUW.router = router
        }
    }
}
typealias Conf = PConfigurator

protocol PPBaseConfig {
    func configure(viewController: UIViewController)
}
class PConfigurator {
    private static var privateShared: PConfigurator = PConfigurator()
    static let shared: PConfigurator = {
        return privateShared
    }()
}
