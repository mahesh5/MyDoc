//
//  PUCommonUtils.swift
//  MyDocTask
//
//  Created by mahesh.varadara on 18/1/20.
//  Copyright © 2020 mahesh.varadara. All rights reserved.
//

import Foundation
import UIKit
// Helper to Return Image Path
class PHUtilHelper {
    private init() { }
    static let shared: PHUtilHelper = PHUtilHelper()
    func getImageFromPath(imagePath: String?) -> UIImage? {
        let imageUrl = URL(fileURLWithPath: imagePath ?? "")
        let image = UIImage(contentsOfFile: imageUrl.path)
        return image
    }
    
    func getDocumentDirectoryImagePath(imageURL: String, index: Int) -> String {
           let url = NSURL(string: imageURL)
           var imagePath = ""
           if let imgData = NSData(contentsOf: url! as URL) {
               let documentsPath = (NSSearchPathForDirectoriesInDomains(.documentDirectory,
                                                                        .userDomainMask, true)[0] as NSString)
               let writePath = documentsPath.appendingPathComponent("myimage\(index).jpg")
               imgData.write(toFile: writePath, atomically: true)
               imagePath = writePath
           }
           return imagePath
       }
}
extension UIImageView {
    func makeRound() {
        clipsToBounds = true
        layer.borderWidth = 2.0
        layer.borderColor = UIColor.lightGray.cgColor
        layer.cornerRadius = self.frame.width / 2
    }
}

extension UIView {
    func setBlurEffect() {
        var blurEffectView = UIVisualEffectView()
        let blurEffect = UIBlurEffect(style: .light)
        blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = bounds
        addSubview(blurEffectView)
    }
}
extension String {
    func convertToDate() -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss'Z'"
        dateFormatter.timeZone = TimeZone.current
        let date = dateFormatter.date(from: self)
        return date
    }
    
}
extension Date {
    func getDateString(format: String = "MMM d, yyyy") -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        formatter.dateFormat = format
        return formatter.string(from: self)
    }
}
public typealias playlistURL = PNURLEndPoints
public struct PNURLEndPoints {
    let baseURL = "https://itunes.apple.com/lookup?amgArtistId=468749,5723&entity=song&limit=50&sort=recent"
}
