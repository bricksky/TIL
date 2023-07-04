//
//  TableViewController.swift
//  URL_Practice
//
//  Created by 김동현 on 2023/07/04.
//

import UIKit

import SnapKit

class TableViewController: UIViewController {
    
    // 서버에서 받아온 값을 저장항 창고 부붅
    var model: MovieModel?
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(TableViewCell.self, forCellReuseIdentifier: TableViewCell.identifier)
        tableView.dataSource = self
        //tableView.delegate = self
        tableView.backgroundColor = .systemMint
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setStyle()
        setLayout()
    }
    
    func setStyle() {
        view.backgroundColor = .black
    }
    
    func setLayout() {
        self.view.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}

extension TableViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return MediaType.allCases.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    { return 1 }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCell.identifier, for: indexPath) as? TableViewCell else
        { return UITableViewCell() }
        
        let type = MediaType(rawValue: indexPath.section) // case movie case podcast -> 바뀌는 부분
        let queryValue = type?.queryValue // "movie" /"podcasat"
        
        // 1.url 만드는 부분
        var urlComponent = URLComponents()
        urlComponent.scheme = "https"
        urlComponent.host = "itunes.apple.com"
        urlComponent.path = "/search"
        
        let term = URLQueryItem(name: "term", value: queryValue)
        let media = URLQueryItem(name: "media", value: queryValue)
        
        let querys = [term, media]
        urlComponent.queryItems = querys
        
        guard let url = urlComponent.url else { return .init() }
        
        // 2.url 요청 보내는 부분
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard error == nil else {
                print("error: ", error)
                return
            }
            
            guard let res = response as? HTTPURLResponse else {
                print("response")
                return
            }
            guard (200..<300).contains(res.statusCode) else {
                print("wrong status code")
                return }
                
            guard let data else {
                print("no data")
                return
            }
            
            do {
                let outputModel = try JSONDecoder().decode(MovieModel.self, from: data)
                dump(outputModel)
            } catch {
                print("error : ", error)
            }
            
        }.resume()
        // 3.특정 변수에 저장하는 부분(내가 생각하는 창고)
        
        // 4.특정 변수에 자장한 내용을 넘겨주는 부분
        //
        return cell
    }
}
