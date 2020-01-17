//
//  PCHReachablity.swift
//  MyDocTask
//
//  Created by mahesh.varadara on 16/1/20.
//  Copyright © 2020 mahesh.varadara. All rights reserved.
//

import Foundation
import UIKit

public class PIViewController: UIViewController {
    init() {
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    //views should be in the loadview method cycle
    override public func loadView() {
        super.loadView()
    }

    override public func viewDidLoad() {
        super.viewDidLoad()
        setup()
        if #available(iOS 13.0, *) {
            // Always adopt a light interface style.
            overrideUserInterfaceStyle = .light
        }
    }

    override public func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }

    fileprivate func setup() {
        //has to be here or there will be a constraint error
        //view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        setupViews()
    }
    func setupViews() {
        //to be overriden in subClasses
    }
    override public var prefersStatusBarHidden: Bool {
        return false
    }

    override public var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
}
