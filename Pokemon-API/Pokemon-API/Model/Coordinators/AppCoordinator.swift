import UIKit

protocol Coordinator {
    var children: [Coordinator] { get }
    func start()
}

final class AppCoordinator: Coordinator {
    
    private(set) var children: [Coordinator] = []
    
    private let window: UIWindow
    
    init(window: UIWindow) {
        self.window = window
    }
    
    func start() {
        let navigationController = UINavigationController()
        
        let pokemonsCoordinator = PokemonsCoordinator(navigationController: navigationController)
        
        children.append(pokemonsCoordinator)
        
        pokemonsCoordinator.start()
        
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
    }
}
