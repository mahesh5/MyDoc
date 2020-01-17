//
//  PIHomeDetailsViewController.swift
//  MyDocTask
//
//  Created by mahesh.varadara on 14/1/20.
//  Copyright (c) 2020 mahesh.varadara. All rights reserved.
//

import UIKit

final class PIHomeDetailsViewController: PIViewController {

    @IBOutlet weak var labelGenere: UILabel!
    @IBOutlet weak var labelTrackReleaseDate: UILabel!
    @IBOutlet weak var labelTrackName: UILabel!
    @IBOutlet weak var labelTrackDescription: UILabel!
    @IBOutlet weak var backgroundView: UIView!
    @IBOutlet weak var backgroundImageView: UIImageView!
    @IBOutlet weak var labelArtistTitle: UILabel!
    @IBOutlet weak var trackImageView: UIImageView!
    var output: PPHomeDetailsInteractorInput?
    var router: PPHomeDetailsRouterProtocol?
    // MARK: - Initializers
    var trackDetail: PVMTracks?

  
    // MARK: - Configurator
   init(configurator: PPBaseConfig =
        PCRHomeDetailsConfigurator.sharedInstance) {
        super.init()
        configure(configurator: configurator)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        configure()
    }
    // MARK: - Configurator
    private func configure(configurator: PPBaseConfig = PCRHomeDetailsConfigurator.sharedInstance) {
        configurator.configure(viewController: self)
    }
    
    deinit {
        //dealloc called
    }
    override func setupViews() {
        super.setupViews()
        labelArtistTitle.text = trackDetail?.artistName
        let newImage = PHUtilHelper.shared.getImageFromPath(imagePath: trackDetail?.trackImage)
        backgroundImageView.image = newImage
        backgroundImageView.setBlurEffect()
        trackImageView.image = newImage
        labelTrackDescription.text = trackDetail?.collectionName
        labelTrackReleaseDate.text = trackDetail?.releaseDate
        labelTrackName.text = trackDetail?.trackName
        labelGenere.text = trackDetail?.genere
        trackImageView.makeRound()
    }
}

// MARK: - PPHomeDetailsPresenterOutput

extension PIHomeDetailsViewController: PPHomeDetailsPresenterOutput {

    func display(with viewModel: PVMHomeDetailsViewModel) {
        DispatchQueue.main.async {
//            self?.contentView.vm = viewModel
        }
    }
}


