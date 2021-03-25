//
//  PokemonCharacter+CoreDataProperties.swift
//  Pokemon-API
//
//  Created by Віталій on 25.03.2021.
//
//

import Foundation
import CoreData


extension PokemonCharacter {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<PokemonCharacter> {
        return NSFetchRequest<PokemonCharacter>(entityName: "PokemonCharacter")
    }

    @NSManaged public var name: String?
    @NSManaged public var url: URL?
    @NSManaged public var image: Data?

}

extension PokemonCharacter : Identifiable {

}
