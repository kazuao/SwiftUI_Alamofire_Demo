//
//  ContentView.swift
//  SwiftUI_Alamofire
//
//  Created by kazunori.aoki on 2021/10/05.
//

// https://www.youtube.com/watch?v=RM5uKTBr20c&list=PL_csAAO9PQ8ZNPl1xawTXzdJtXzm_vjJ5&index=3

import SwiftUI

struct ContentView: View {
    
    @StateObject private var viewModel = ContentViewModel()
    
    var body: some View {
        ScrollView {
            Text(viewModel.post.title)
                .font(.title)
            
            Text(viewModel.post.body)
                .font(.body)
            
            Divider()
            
            Button {
                fetchPost()
            } label: {
                Text("Fetch")
            }
        }
        .navigationTitle("Networking")
    }
    
    func fetchPost() {
        viewModel.fetch(postWithId: 1) { error in
            if let error = error {
                print(error)
                return
            }
            
            print("Successfully fetched post: \(viewModel.post)")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
