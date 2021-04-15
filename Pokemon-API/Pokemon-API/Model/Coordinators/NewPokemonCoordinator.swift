import UIKit

final class NewPokemonCoordinator: Coordinator {
    
    private(set) var children: [Coordinator] = []
    
    private let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let viewModel = NewPokemonViewModel()
        let newPokemonController = NewPokemonVC(viewModel: viewModel)
        navigationController.present(newPokemonController, animated: true)
    }
}
