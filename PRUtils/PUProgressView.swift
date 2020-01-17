//
//  PUProgressView.swift
//  MyDocTask
//
//  Created by mahesh.varadara on 14/1/20.
//  Copyright © 2020 mahesh.varadara. All rights reserved.
//

import UIKit

open class PUProgressView {
    public static let shared = PUProgressView()
    
    var containerView = UIView()
    var progressView = UIView()
    var activityIndicator = UIActivityIndicatorView()
    
    open func showProgressView() {
        let window = UIWindow(frame: UIScreen.main.bounds)
        
        containerView.frame = window.frame
        containerView.center = window.center
        containerView.backgroundColor = UIColor(white: 0xCCCCCC, alpha: 0.9)
        
        progressView.frame = CGRect(x: 0, y: 0, width: 80, height: 80)
        progressView.center = window.center
        progressView.backgroundColor = UIColor.lightGray
        progressView.clipsToBounds = true
        progressView.layer.cornerRadius = 10
        
        activityIndicator.frame = CGRect(x: 0, y: 0, width: 40, height: 40)
        activityIndicator.style = .large
        activityIndicator.color = .white
        activityIndicator.center = CGPoint(x: progressView.bounds.width / 2, y: progressView.bounds.height / 2)
        
        progressView.addSubview(activityIndicator)
        containerView.addSubview(progressView)
        UIApplication.shared.windows.filter {$0.isKeyWindow}.first?.addSubview(containerView)
        activityIndicator.startAnimating()
    }
    
    open func hideProgressView() {
        DispatchQueue.main.async {
            self.activityIndicator.stopAnimating()
            self.containerView.removeFromSuperview()
        }
    }
}


