import Foundation

final class NewPokemonViewModel: NewPokemonViewModelProtocol {
    
    var name: String? {
        didSet {
            didChangeName?(self)
        }
    }
    
    var didChangeName: ((NewPokemonViewModelProtocol) -> ())?
    var didChangeBaseExperience: ((NewPokemonViewModelProtocol) -> ())?
    var didChangeHeight: ((NewPokemonViewModelProtocol) -> ())?
    var didChangeWidth: ((NewPokemonViewModelProtocol) -> ())?
    
    func addNewPokemon(_ pokemon: Pokemon) {
        // TODO: Save into database
    }
}
