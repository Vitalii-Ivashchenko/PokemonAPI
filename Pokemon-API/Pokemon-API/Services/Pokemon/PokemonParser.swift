import Foundation

class PokemonParser {
    
    static func parsePokemons(from data: Data) -> [PokemonServiceResponse.Pokemon] {
        do {
            let decoder = try JSONDecoder().decode(PokemonServiceResponse.self, from: data)
            return decoder.pokemons
        } catch {
            print(error)
            return []
        }
    }
}
