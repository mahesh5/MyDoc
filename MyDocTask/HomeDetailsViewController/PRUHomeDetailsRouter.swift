//
//  PRUHomeDetailsRouter.swift
//  MyDocTask
//
//  Created by mahesh.varadara on 14/1/20.
//  Copyright (c) 2020 mahesh.varadara. All rights reserved.
//

import Foundation

protocol PPHomeDetailsRouterProtocol {

    var viewController: PIHomeDetailsViewController? { get }

    func navigateToSomewhere()
}

final class PRUHomeDetailsRouter {

    weak var viewController: PIHomeDetailsViewController?

    // MARK: - Initializers

    init(viewController: PIHomeDetailsViewController?) {
        self.viewController = viewController
    }
}

// MARK: - PPHomeDetailsRouterProtocol
extension PRUHomeDetailsRouter: PPHomeDetailsRouterProtocol {

    // MARK: - Navigation
    func navigateToSomewhere() {

    }
}
