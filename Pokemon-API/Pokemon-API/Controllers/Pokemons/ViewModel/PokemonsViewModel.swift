import Foundation

final class PokemonsViewModel {
    
    let title = "Pokemons"
    
    var coordinator: PokemonsCoordinator?
    var updateView: (() -> ())?
    
    private var pokemons = [Pokemon]()
    private let service: PokemonServiceProtocol
    
    init(service: PokemonServiceProtocol) {
        self.service = service
    }
    
    var numberOfRows: Int {
        return pokemons.count
    }
    
    func getPokemons() {
        service.getPokemons { [weak self] pokemons in
            
            guard let self = self, let pokemons = pokemons else { return }
            self.pokemons = pokemons
            self.updateView?()
        }
    }
    
    func getPokemon(at indexPath: IndexPath) -> Pokemon {
        return pokemons[indexPath.row]
    }
    
    func tappedAddPokemon() {
        coordinator?.startNewPokemon()
    }
}
