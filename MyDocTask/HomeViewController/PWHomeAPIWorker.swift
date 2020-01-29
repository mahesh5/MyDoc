//
//  PWHomeAPIWorker.swift
//  MyDocTask
//
//  Created by mahesh.varadara on 10/1/20.
//  Copyright (c) 2020 mahesh.varadara. All rights reserved.
//

import Foundation
import Alamofire
import Promises
import UIKit


protocol PPHomeAPIWorker {
   // func getPlayList()->Promise<Playlist>
    //Method with generics
    func getUrl<T: Decodable>(type: T.Type)->Promise<T>
}

class PWHomeAPIWorker: PPHomeAPIWorker {
     // MARK: - Business Logic
    func getPlayList() -> Promise<Playlist> {
        return Promise<Playlist>(on: .global(qos: .background)) { (fullfill, reject) in
            let url = playlistURL().baseURL
            Alamofire.request(url).response { response in
                guard let data = response.data else { return }
                do {
                    let decoder = JSONDecoder()
                    let response = try decoder.decode(Playlist.self, from: data)
                    fullfill(response)
                } catch let error {
                    print(error)
                    reject(error)
                }
            }
        }
    }
    
    //Method with generics
    func getUrl<T: Decodable>(type: T.Type)->Promise<T> {
        return Promise<T>(on: .global(qos: .background)) { (fullfill, reject) in
            let url = playlistURL().baseURL
            Alamofire.request(url).response { response in
                guard let data = response.data else { return }
                do {
                    let decoder = JSONDecoder()
                    let response = try decoder.decode(T.self, from: data)
                    fullfill(response)
                } catch let error {
                    print(error)
                    reject(error)
                }
            }
        }
    }
}


