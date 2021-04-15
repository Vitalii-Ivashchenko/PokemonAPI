//
//  PokemonEntity+CoreDataProperties.swift
//  Pokemon-API
//
//  Created by Віталій on 14.04.2021.
//
//

import Foundation
import CoreData


extension PokemonEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<PokemonEntity> {
        return NSFetchRequest<PokemonEntity>(entityName: "PokemonEntity")
    }

    @NSManaged public var detailURL: URL?
    @NSManaged public var image: Data?
    @NSManaged public var name: String?

}

extension PokemonEntity : Identifiable {

}
