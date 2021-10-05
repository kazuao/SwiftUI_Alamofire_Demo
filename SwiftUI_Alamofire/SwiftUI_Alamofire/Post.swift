//
//  Post.swift
//  SwiftUI_Alamofire
//
//  Created by kazunori.aoki on 2021/10/05.
//

import Foundation
import Networking

struct Post: Codable {
    let userId: Int
    let id: Int
    let title: String
    let body: String
    
    init(userId: Int? = nil, id: Int? = nil, title: String? = nil, body: String? = nil) {
        self.userId = userId ?? 0
        self.id = id ?? 0
        self.title = title ?? ""
        self.body = body ?? ""
    }
}

extension Post: NetworkingJSONDecodable {}
