//
//  PRUHomeRouter.swift
//  MyDocTask
//
//  Created by mahesh.varadara on 10/1/20.
//  Copyright (c) 2020 mahesh.varadara. All rights reserved.
//

import Foundation
import UIKit
protocol PPHomeRouterProtocol {

    var viewController: PIHomeViewController? { get }

    func navigateToDetailVC(selectedTrack: PVMTracks?)
}

final class PRUHomeRouter {

    weak var viewController: PIHomeViewController?

    // MARK: - Initializers

    init(viewController: PIHomeViewController?) {
        self.viewController = viewController
    }
}

// MARK: - PPHomeRouterProtocol
extension PRUHomeRouter: PPHomeRouterProtocol {
    // MARK: - Navigation
    func navigateToDetailVC(selectedTrack: PVMTracks?) {
        let config = PCRHomeDetailsConfigurator()
        config.configure(viewController: PIHomeDetailsViewController())
        let mainStoryboard = UIStoryboard(name: PCString.main, bundle: nil)
        let vc = mainStoryboard.instantiateViewController(withIdentifier: PCString.detailVC) as! PIHomeDetailsViewController
        vc.trackDetail = selectedTrack
        viewController?.navigationController?.pushViewController(vc, animated: true)
    }
    
}
