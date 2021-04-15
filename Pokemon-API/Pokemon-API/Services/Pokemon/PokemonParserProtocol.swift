import Foundation

protocol PokemonParserProtocol {
    static func parsePokemons(from data: Data) -> [PokemonServiceResponse.Pokemon]
}
