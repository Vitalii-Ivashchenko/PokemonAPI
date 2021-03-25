//
//  PokemonsCoordinator.swift
//  Pokemon-API
//
//  Created by Віталій on 25.03.2021.
//

import UIKit

final class PokemonsCoordinator: Coordinator {
    
    private(set) var children: [Coordinator] = []
    
    private let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let pokemonsViewController = PokemonsViewController()
        navigationController.setViewControllers([pokemonsViewController], animated: false)
    }
}
