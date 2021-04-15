import UIKit

final class PokemonsCoordinator: Coordinator {
    
    private(set) var children: [Coordinator] = []
    
    private let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let service = PokemonWebService()
        let viewModel = PokemonsViewModel(service: service)
        viewModel.coordinator = self
        let pokemonsViewController = PokemonsViewController(viewModel: viewModel)
        navigationController.setViewControllers([pokemonsViewController], animated: false)
    }
    
    func startNewPokemon() {
        let newPokemonCoordinator = NewPokemonCoordinator(navigationController: navigationController)
        children.append(newPokemonCoordinator)
        newPokemonCoordinator.start()
    }
}
