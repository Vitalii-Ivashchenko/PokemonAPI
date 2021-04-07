import Foundation

final class PokemonsViewModel {
    
    let title = "Pokemons"
    
    var coordinator: PokemonsCoordinator?
    
    private var pokemons = [Pokemon]()
    
    var updateView: (([Pokemon]) -> ())?
    
    func getPokemons() {
        NetworkManager.request(decodeType: PokemonResponse.self, urlString: "https://pokeapi.co/api/v2/pokemon/?limit=100000") { [weak self] (result) in
            
            switch result {
            case .success(let response):
                self?.updateView?(response.pokemons)
            case .failure(_):
                break
            }
        }
    }
    
    func tappedAddPokemon() {
        coordinator?.startNewPokemon()
    }
}
