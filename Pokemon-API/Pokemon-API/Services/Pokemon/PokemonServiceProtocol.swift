import Foundation

protocol PokemonServiceProtocol {
    func getPokemons(completion: @escaping ([Pokemon]?) -> Void)
}
