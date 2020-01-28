//
//  TracksTableViewCell.swift
//  MyDocTask
//
//  Created by mahesh.varadara on 13/1/20.
//  Copyright © 2020 mahesh.varadara. All rights reserved.
//

import UIKit

class TracksTableViewCell: UITableViewCell {
    @IBOutlet weak var labelTrackInfo: UILabel!
    @IBOutlet weak var trackImageView: UIImageView!
    @IBOutlet weak var labelTitle: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        trackImageView.makeRound()
    }
    func updateLabel(data: PVMTracks) {
        labelTitle.text = data.trackName
        let trackImage = PHUtilHelper.shared.getImageFromPath(imagePath: data.trackImage ?? PCString.blank)
        trackImageView.image = trackImage
        labelTrackInfo.text = data.collectionName
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}

