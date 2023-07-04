////
////  MainViewController.swift
////  URL_Practice
////
////  Created by 김동현 on 2023/07/04.
////
//
//import UIKit
//
//import SnapKit
//
//class MinJaeMainViewController: UIViewController {
//
//    let data: Model? // 창고
//
//
//    lazy var tableView: UITableView = {
//        let tableView = UITableView()
//        tableView.register(TableViewCell.self, forCellReuseIdentifier: TableViewCell.identifier)
//        tableView.dataSource = self
//        tableView.delegate = self
//        tableView.backgroundColor = .systemMint
//        return tableView
//    }()
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        setStyle()
//        setLayout()
//    }
//    func setStyle() {
//        view.backgroundColor = .black
//    }
//}
//
//extension MainViewController: UITableViewDataSource {
//    func numberOfSections(in tableView: UITableView) -> Int {
//        return MediaType.allCases.count
//    }
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
//    { return 1 }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        guard let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCell.identifier, for: indexPath) as? TableViewCell else {return UITableViewCell() }
//
//        // URL만들 때 URL만들 때
////        let type = MediaType(rawValue: indexPath.section) // case movie case podcast -> 바뀌는 부분
////        let queryValue = type?.queryValue // "movie" /"podcasat"
//
//
//        // 1. URL만들기
//        var urlComponent = URLComponents()
//        // itunes url에서 각 케이스의 데이터를 넣어주는 부분
//        // 데이터를 받아올 itunes url "https://itunes.apple.com/search?media=\(type.queryValue)&term=movie"
//        urlComponent.scheme = "https"
//        urlComponent.host = "itunes.apple.com"
//        urlComponent.path = "/search"
//
//        let term = URLQueryItem(name: "term", value: queryValue)
//        let media = URLQueryItem(name: "media", value: queryValue)
//
//        let querys = [term, media]
//        urlComponent.queryItems = querys
//
//        guard let url = urlComponent.url else { return .init() }
//
//
//        // 2. URL 요청 보내기 GET
//        URLSession.shared.dataTask(with: url) { data, response, error in
//            guard error == nil else { return }
//
//            guard let res = response as? HTTPURLResponse else { return }
//            guard (200..<300).contains(res.statusCode) else { return }
//
//            let outputModel = JSONDecoder().decode(Model.self, from: data)
//
//            // 3. 특정 변수에 저장
//            self.model = outputModel
//
//        }
//        // 3-1. 넘겨주기
//        cell.data = model
//        return cell
//    }
//}
//
//extension MainViewController: UITableViewDelegate {
//
//}
//
//
