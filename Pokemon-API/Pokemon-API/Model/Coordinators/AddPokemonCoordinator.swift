import UIKit

final class NewPokemonCoordinator: Coordinator {
    
    private(set) var children: [Coordinator] = []
    
    private let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let newPokemonController = NewPokemonVC()
        navigationController.present(newPokemonController, animated: true)
    }
}
