//
//  RMCharacretDetailViewController.swift
//  RickAndMorty
//
//  Created by Miras Iskakov on 14.02.2024.
//

import UIKit
/// Contoller to show info about single character
final class RMCharacretDetailViewController: UIViewController {

    private let viewModel: RMCharacretDetailViewViewModel
    
    init(viewModel: RMCharacretDetailViewViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("Unsupported")
    }
    
    
// MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        title = viewModel.title

    }
    
}
