//
//  PromissHandler.swift
//  SwiftUI_Alamofire
//
//  Created by kazunori.aoki on 2021/10/05.
//

import Foundation
import Combine

struct PromiseHandler<T: Codable> {
    
    static func fulfill(_ promise: AnyPublisher<T, Error>, storedId cancellables: inout Set<AnyCancellable>, completion: @escaping (Result<T, Error>) -> ()) {
        
        promise.sink { result in
            switch result {
            case .finished:
                break
                
            case .failure(let error):
                error.printError()
                completion(.failure(error))
            }
        } receiveValue: { value in
            completion(.success(value))
        }
        .store(in: &cancellables)
    }
    
//    static func fulfillArray(_ promise: AnyPublisher<T, Error>, storedId cancellables: inout Set<AnyCancellable>, completion: @escaping (Result<[T], Error>) -> ()) {
//
//        promise.sink { result in
//            switch result {
//            case .finished:
//                break
//
//            case .failure(let error):
//                error.printError()
//                completion(.failure(error))
//            }
//        } receiveValue: { values in
//            completion(.success(values))
//        }
//        .store(in: &cancellables)
//    }
//
//
//    static func fulfillDelete(_ promise: AnyPublisher<Void, Error>, storedId cancellables: inout Set<AnyCancellable>, completion: @escaping (Result<Void, Error>) -> ()) {
//
//        promise.sink { result in
//            switch result {
//            case .finished:
//                break
//
//            case .failure(let error):
//                error.printError()
//                completion(.failure(error))
//            }
//        } receiveValue: { values in
//            completion(.success(values))
//        }
//        .store(in: &cancellables)
//    }
}
