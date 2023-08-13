//
//  ContentView.swift
//  PokeDex
//
//  Created by Oliver Zheng on 8/6/23.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var viewModel = PokesViewModel()
    
    var body: some View {
        NavigationView{
                    List(viewModel.pokes.indices, id: \.self){ idx in
                        HStack{
                            AsyncImage(url: URL(string: getUrl(viewModel.pokes[idx].name))){ image in
                                image
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 100, height: 100)
                            } placeholder: {
                                Text("Loading")
                            }
                            VStack(alignment: .leading){
                                Text(viewModel.pokes[idx].name.capitalizedSentence)
                                    .font(.system(size: 25).bold())
                                Text("#\(idx + 1)")
                                HStack{
                                    Text("See")
                                   // NavigationLink(destination: Text("info")){
                                        Text("More")
                                  //  }
                                }
                            }
                           .padding()
                        }
                        .listRowSeparator(.hidden)
                    }
            .onAppear{
                viewModel.getData()
            }
            .navigationTitle("PokeDex")
        }
    }
    private func getUrl(_ name: String) -> String {
        let url = "https://img.pokemondb.net/artwork/large/"
        let res = url +  name + ".jpg"
        return res
    }
}
extension String {
    var capitalizedSentence: String {
        // 1
        let firstLetter = self.prefix(1).capitalized
        // 2
        let remainingLetters = self.dropFirst().lowercased()
        // 3
        return firstLetter + remainingLetters
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
