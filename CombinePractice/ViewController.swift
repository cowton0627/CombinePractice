//
//  ViewController.swift
//  CombinePractice
//
//  Created by Chun-Li Cheng on 2021/12/28.
//

import UIKit
import Combine

class MyTableViewCell: UITableViewCell {
    private let button: UIButton = {
        let button = UIButton()
        button.backgroundColor = .systemPink
        button.setTitle("Button", for: .normal)
        button.setTitleColor(.white, for: .normal)
        return button
    }()
    
    let action = PassthroughSubject<String, Never>()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(button)
        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    @objc func didTapButton() {
        action.send("Button Tapped")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        button.frame = CGRect(x: 10, y: 3, width: contentView.frame.size.width-20, height: contentView.frame.size.height-6)
    }
}

class ViewController: UIViewController {
    
    private let tableView: UITableView = {
        let table = UITableView()
        table.register(MyTableViewCell.self,
                       forCellReuseIdentifier: "cell")
        return table
    }()
    
//    var observer: AnyCancellable?
    var observers: [AnyCancellable] = []

    private var models = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableView)
        tableView.frame = view.bounds
        tableView.delegate = self
        tableView.dataSource = self
        
//        observer =
        APICaller.shared.fetchCompanies()
            .receive(on: DispatchQueue.main, options: nil)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .finished:
                    print("finished")
                case .failure(let err):
                    print(err)
                }
        }, receiveValue: { [weak self] value in
            self?.models = value
            self?.tableView.reloadData()
        }).store(in: &observers)
    }


}
extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? MyTableViewCell else {
            return UITableViewCell()
        }
//        cell.textLabel?.text = models[indexPath.row]
        cell.action.sink { string in
            print(string)
        }.store(in: &observers)
        
        return cell
    }
    
    
}

extension ViewController: UITableViewDelegate {
    
}

