//
//  RMCharacterViewController.swift
//  RickAndMorty
//
//  Created by Miras Iskakov on 29.01.2024.
//

import UIKit

final class RMCharacterViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        title = "Character"
        
        RMService.shared.execute(.listCharecterRequest,
                                 expecting: String.self) { result in
            switch result {
            case .success(let model):
                print(String(describing: model))
            case .failure(let error):
                print(String(describing: error))
            }
        }
    }
    

}
