//
//  PokeService.swift
//  PokeDex
//
//  Created by Oliver Zheng on 8/6/23.
//

import Foundation
enum APIError: Error{
    case invalidUrl
    case invalidResponse
}

class PokeService{
    let urlString = "https://pokeapi.co/api/v2/pokemon/?limit=100&offset=0"
    
    func fetchPokeData() async throws -> [Results] {
        guard let url = URL(string: urlString) else {
            throw APIError.invalidUrl
        }
        let (data, resp) = try await URLSession.shared.data(from: url)
        guard let statusCode = (resp as? HTTPURLResponse)?.statusCode, 200...299 ~= statusCode else {
            throw APIError.invalidResponse
        }
        let pokes = try JSONDecoder().decode(Pokes.self, from: data)
        return pokes.results
    }
    
}
