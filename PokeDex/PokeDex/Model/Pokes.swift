//
//  Pokes.swift
//  PokeDex
//
//  Created by Oliver Zheng on 8/6/23.
//

import Foundation

struct Pokes: Codable, Hashable {
    let results: [Results]
}

struct Results: Codable, Hashable {
    let name: String
    let url: String
}
