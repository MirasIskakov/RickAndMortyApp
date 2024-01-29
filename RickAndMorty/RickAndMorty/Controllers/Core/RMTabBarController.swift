//
//  RMTabBarController.swift
//  RickAndMorty
//
//  Created by Miras Iskakov on 29.01.2024.
//

import UIKit

final class RMTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpTabs()
    }

    private func setUpTabs() {
        let characterVC = RMCharacterViewController()
        let locationVC = RMLocationViewController()
        let episodeVC = RMEpisodeViewController()
        let settingsVC = RMSettingsViewController()
        
        characterVC.navigationItem.largeTitleDisplayMode = .automatic
        locationVC.navigationItem.largeTitleDisplayMode = .automatic
        episodeVC.navigationItem.largeTitleDisplayMode = .automatic
        settingsVC.navigationItem.largeTitleDisplayMode = .automatic

        let navCharacter = UINavigationController(rootViewController: characterVC)
        let navLocation = UINavigationController(rootViewController: locationVC)
        let navEpisode = UINavigationController(rootViewController: episodeVC)
        let navSettings = UINavigationController(rootViewController: settingsVC)
        
        navCharacter.tabBarItem = UITabBarItem(title: "Character",
                                              image: UIImage(systemName: "person.3"),
                                              tag: 1)
        navLocation.tabBarItem = UITabBarItem(title: "Location",
                                              image: UIImage(systemName: "location"),
                                              tag: 2)
        navEpisode.tabBarItem = UITabBarItem(title: "Episode",
                                              image: UIImage(systemName: "play.tv"),
                                              tag: 3)
        navSettings.tabBarItem = UITabBarItem(title: "Settings",
                                              image: UIImage(systemName: "gear"),
                                              tag: 4)
        
        for nav in [navCharacter, navLocation, navEpisode, navSettings] {
            nav.navigationBar.prefersLargeTitles = true
        }
        
        setViewControllers(
            [navCharacter, navLocation, navEpisode, navSettings],
            animated: true)
    }
}

