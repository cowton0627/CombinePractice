//
//  SecondViewController.swift
//  CombinePractice
//
//  Created by Chun-Li Cheng on 2021/12/28.
//

import UIKit
import Combine

class SecondTableViewCell: UITableViewCell {
    @IBOutlet weak var nameLabel: UILabel!
    var actionPublisher = PassthroughSubject<Action, Never>()
    
    private var animal: Animal?
    
    func populate(with animal: Animal) {
        self.animal = animal
        nameLabel.text = animal.name
    }
    
    @IBAction func didTapShowEmojiButton() {
        guard let animal = animal else {
            return
        }
        actionPublisher.send(.showEmoji(animal))
    }
    
    @IBAction func didTapMakeNoiseButton() {
        guard let animal = animal else {
            return
        }
        actionPublisher.send(.makeNoise(animal))
    }
    
}
extension SecondTableViewCell {
    enum Action {
        case showEmoji(Animal)
        case makeNoise(Animal)
    }
}

class SecondViewController: UIViewController {
    @IBOutlet weak var secondTableView: UITableView!
    
    var animals = [Animal]()
    var getAnimalsToken: AnyCancellable?
    var tokens = Set<AnyCancellable>()

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Animals"
        navigationController?.navigationBar.prefersLargeTitles = true
        secondTableView.dataSource = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        getAnimals()
    }
    
    func getAnimals() {
        getAnimalsToken =
        NetworkingService.getAnimals()
//            .receive(on: DispatchQueue.main)
            .sink(
                receiveCompletion: { (completion) in
                    switch completion {
                        case .finished:
                            print("Publisher stopped observing")
                           
                        case .failure(let error):
                            print("This is any error passed to our future", error)
                    }
                }, receiveValue: { [weak self] (animals) in
                    self?.animals = animals
//                    self?.secondTableView.reloadData()
                }
            )
    }
    
    func showEmoji(for animal: Animal) {
        AlertService.showAlert(with: animal.emoji, in: self)
    }
    
    func makeNoise(for animal: Animal) {
        AlertService.showAlert(with: animal.noise, in: self)
    }
    
}

extension SecondViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        animals.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "\(SecondTableViewCell.self)", for: indexPath) as? SecondTableViewCell else {
            return SecondTableViewCell()
        }
        
        let animal = animals[indexPath.row]
        cell.populate(with: animal)
                
        cell.actionPublisher.sink(receiveValue:  { [weak self] action in
            switch action {
                case .showEmoji(let animal):
                    self?.showEmoji(for: animal)
                        
                case .makeNoise(let animal):
                    self?.makeNoise(for: animal)
            }
        }).store(in: &tokens)
                                          
        return cell
    }
    
    
}
