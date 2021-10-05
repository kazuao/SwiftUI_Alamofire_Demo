//
//  ContentViewModel.swift
//  SwiftUI_Alamofire
//
//  Created by kazunori.aoki on 2021/10/05.
//

import SwiftUI
import Combine
import Networking

class ContentViewModel: ObservableObject {
    
    private let api = API()
    
    @Published var post: Post = Post()
    @Published var posts: [Post] = []
    
    var cancellables: Set<AnyCancellable> = []
    
    func fetch(postWithId id: Int, completion: @escaping (Error?) -> ()) {
        let promise = api.fetch(postWithId: id)
        
        PromiseHandler<Post>.fulfill(promise, storedId: &cancellables) { result in
            switch result {
            case .success(let post):
                self.post = post
                completion(nil)
                
            case .failure(let error):
                completion(error)
            }
        }
    }
    
//    func create(post: Post, completion: @escaping (Error?) -> ()) {
//        let promise = api.create(post: post)
//        
//        PromiseHandler<Post>.fulfill(promise, storedId: &cancellables) { result in
//            switch result {
//            case .success(let post):
//                self.post = post
//                completion(nil)
//                
//            case .failure(let error):
//                completion(error)
//            }
//        }
//    }
//    
//    func update(post: Post, completion: @escaping (Error?) -> ()) {
//        let promise = api.update(post: post)
//        
//        PromiseHandler<Post>.fulfill(promise, storedId: &cancellables) { result in
//            switch result {
//            case .success(let post):
//                self.post = post
//                completion(nil)
//                
//            case .failure(let error):
//                completion(error)
//            }
//        }
//    }
//    
//    func patch(post: Post, completion: @escaping (Error?) -> ()) {
//        let promise = api.patch(post: post)
//        
//        PromiseHandler<Post>.fulfill(promise, storedId: &cancellables) { result in
//            switch result {
//            case .success(let post):
//                self.post = post
//                completion(nil)
//                
//            case .failure(let error):
//                completion(error)
//            }
//        }
//    }
//    
//    func delete(post: Post, completion: @escaping (Error?) -> ()) {
//        let promise = api.delete(post: post)
//        
//        PromiseHandler<Post>.fulfillDelete(promise, storedId: &cancellables) { error in
//            if let error = error {
//                completion(error)
//                return
//            }
//            
//            self.post = Post()
//            completion(nil)
//        }
//    }
//
//    
//    func fetchPost(completion: @escaping (Error?) -> ()) {
//        let promise = api.fetchPosts()
//        
//        PromiseHandler<Post>.fulfillArray(promise, storedId: &cancellables) { result in
//            switch result {
//            case .success(let posts):
//                self.posts = posts
//                completion(nil)
//                
//            case .failure(let error):
//                completion(error)
//            }
//        }
//    }
//    
}
