import Foundation

struct GoogleResponse: Decodable {
    let items: [GooglePokemonResponse]
}

struct GooglePokemonResponse: Decodable {
    let link: String
}
