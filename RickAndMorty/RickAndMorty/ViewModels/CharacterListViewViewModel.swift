//
//  CharacterListViewViewModel.swift
//  RickAndMorty
//
//  Created by Miras Iskakov on 31.01.2024.
//

import UIKit

final class CharacterListViewViewModel: NSObject {
    func fatchCharacters() {
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
    
    private func fetchAdditionalCharacter() {
       // isLoadingMoreChatacter = true
    }
}

extension CharacterListViewViewModel: UICollectionViewDataSource,
                                      UICollectionViewDelegate,
                                      UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: CharacterCollectionViewCell.cellIdentifier,
            for: indexPath
        ) as? CharacterCollectionViewCell else {
            fatalError("Unsupported cell")
        }
        let viewModel = CharacterCollectionViewCellViewModel(characretName: "Miras",
                                                           characretStatus: .alive,
                                                           characretImageUrl: nil)
        cell.configure(with: viewModel )
        return cell
    }

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        let bounds = UIScreen.main.bounds
        let width = (bounds.width-30)/2
        return CGSize (
        width: width,
        height: width * 1.5)
    }
}
