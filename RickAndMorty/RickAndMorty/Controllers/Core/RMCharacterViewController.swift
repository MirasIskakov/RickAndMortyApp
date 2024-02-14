//
//  RMCharacterViewController.swift
//  RickAndMorty
//
//  Created by Miras Iskakov on 29.01.2024.
//

import UIKit

final class RMCharacterViewController: UIViewController, CharacterListViewDelegate {

    private let characterListView = CharacterListView()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        title = "Character"
        
        setUpView()
    }
    
    private func setUpView() {
        characterListView.delegate = self
        view.addSubview(characterListView)
        NSLayoutConstraint.activate([
            characterListView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            characterListView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            characterListView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor),
            characterListView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    
//    MARK: - CharacterListViewDelegate
    
    func rmCharacterListView(_ characretListView: CharacterListView, didSelectCharacter character: RMCharacter) {
//        open detail controller for that character
        let viewModel = RMCharacretDetailViewViewModel(character: character)
        let detailVC = RMCharacretDetailViewController(viewModel: viewModel)
        detailVC.navigationItem.largeTitleDisplayMode = .never
        navigationController?.pushViewController(detailVC, animated: true)
    }
}
    


