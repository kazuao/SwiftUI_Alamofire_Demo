//
//  API.swift
//  SwiftUI_Alamofire
//
//  Created by kazunori.aoki on 2021/10/05.
//

import Networking
import Combine
import SwiftUI

class NetworkSetup {
    lazy var network: NetworkingClient = {
        var network = NetworkingClient(baseURL: "https://jsonplaceholder.typicode.com")
        network.timeout = 5
        network.logLevels = .debug
        
        return network
    }()
}

struct API: NetworkingService {
    var network = NetworkSetup().network
    
    func fetch(postWithId id: Int) -> AnyPublisher<Post, Error> {
        get("/posts/\(id)")
    }
    
    func create(post: Post) -> AnyPublisher<Post, Error> {
        self.post("/posts", params: ["userId": post.userId, "id": post.id, "title": post.title, "body": post.body])
    }
    
    func update(post: Post) -> AnyPublisher<Post, Error> {
        put("/posts/\(post.id)", params: ["title": post.title, "body": post.body])
    }
    
    func patch(post: Post) -> AnyPublisher<Post, Error> {
        patch("/posts/\(post.id)", params: ["title": post.title, "body": post.body])
    }
    
    func delete(post: Post) -> AnyPublisher<Void, Error> {
        delete("/posts/\(post.id)")
    }
    
    func fetchPosts() -> AnyPublisher<[Post], Error> {
        get("/posts")
    }
}
