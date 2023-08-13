//
//  PokesViewModel.swift
//  PokeDex
//
//  Created by Oliver Zheng on 8/6/23.
//

import Foundation

class PokesViewModel: ObservableObject {
    
    @Published var pokes: [Results] = []
    let service = PokeService()
    
    @MainActor func getData(){
        Task{
            do{
                let pokes: [Results] = try await service.fetchPokeData()
                self.pokes = pokes
            } catch{
                if let error = error as? APIError{
                    print(error)
                } else{
                    print(error.localizedDescription)
                }
            }
        }
    }
}
