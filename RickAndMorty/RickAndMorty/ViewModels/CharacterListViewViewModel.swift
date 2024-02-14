//
//  CharacterListViewViewModel.swift
//  RickAndMorty
//
//  Created by Miras Iskakov on 31.01.2024.
//

import UIKit

protocol CharacterListViewViewModelDelegate: AnyObject {
    func didLoadInitialCharacter()
    func didSelectCharacter(_ characret: RMCharacter)
}

/// View Model to hendle character list view logic
final class CharacterListViewViewModel: NSObject {
    
    public weak var deledate: CharacterListViewViewModelDelegate?
    
    private var characters: [RMCharacter] = [] {
        didSet {
            for character in characters {
                let viewModel = CharacterCollectionViewCellViewModel(
                    characretName: character.name,
                    characretStatus: character.status,
                    characretImageUrl: URL(string: character.image)
                )
                cellViewModels.append(viewModel)
            }
        }
    }
    
    private var cellViewModels: [CharacterCollectionViewCellViewModel] = []
    
    private var apiInfo: RMGetAllCharactersResponseInfo.Info? = nil
    
    /// fatch initial set of characters (20)
    public func fatchCharacters() {
        RMService.shared.execute(
            .listCharecterRequest,
            expecting: RMGetAllCharactersResponseInfo.self
        ) { [weak self]result in
            switch result {
            case .success(let responseModel):
                let results = responseModel.results
                let info = responseModel.info
                self?.apiInfo = info
                self?.characters = results
                DispatchQueue.main.async {
                    self?.deledate?.didLoadInitialCharacter()
                }
            case .failure(let error):
                print(String(describing: error))
            }
        }
    }
    /// Paginate if additional characters are needed
    private func fetchAdditionalCharacter() {
       // isLoadingMoreChatacter = true
    }

    public var shouldShowLoadMoreIndicator: Bool {
        return apiInfo?.next != nil
    }
}
    
    
//MARK: - Collection View

extension CharacterListViewViewModel: UICollectionViewDataSource,
                                      UICollectionViewDelegate,
                                      UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        return cellViewModels.count
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: CharacterCollectionViewCell.cellIdentifier,
            for: indexPath
        ) as? CharacterCollectionViewCell else {
            fatalError("Unsupported cell")
        }
        cell.configure(with: cellViewModels[indexPath.row])
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
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        let character = characters[indexPath.row]
        deledate?.didSelectCharacter(character)
        
    }
}

//MARK: - ScrollView

extension CharacterListViewViewModel: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        guard shouldShowLoadMoreIndicator else {
            return
        }
    }
}
