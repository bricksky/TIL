//
//  ViewController.swift
//  URL_Practice
//
//  Created by 김동현 on 2023/07/03.
//

import UIKit

class ViewController: UIViewController {
    
    // 객체 생성
    var urlComponent: URLComponents = {
        var urlComponent = URLComponents()
        // itunes url에서 각 케이스의 데이터를 넣어주는 부분
        // 데이터를 받아올 itunes url "https://itunes.apple.com/search?media=movie&term=movie"
        urlComponent.scheme = "https"
        urlComponent.host = "itunes.apple.com"
        urlComponent.path = "/search"
        
        let term = URLQueryItem(name: "term", value: MediaType.podcast.queryValue)
        let media = URLQueryItem(name: "media", value: MediaType.movie.queryValue)
        
        let querys = [term, media]
        urlComponent.queryItems = querys
        return urlComponent
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let url = urlComponent.url {
            print(url)
            print(type(of: url))
        }
    }
}

enum MediaType: Int, CaseIterable {
    case movie
    case podcast
    case music
    case musicVideo
    case tvShow

    
    var queryValue: String {
        return "\(self)"
    }
}
