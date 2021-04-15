import Foundation

protocol NewPokemonViewModelProtocol: AnyObject {

    var name: String? { get set }
    var didChangeName: ((NewPokemonViewModelProtocol) -> ())? { get set }
    var didChangeBaseExperience: ((NewPokemonViewModelProtocol) -> ())? { get set }
    var didChangeHeight: ((NewPokemonViewModelProtocol) -> ())? { get set }
    var didChangeWidth: ((NewPokemonViewModelProtocol) -> ())? { get set }
    
    func addNewPokemon(_ pokemon: Pokemon)
}
