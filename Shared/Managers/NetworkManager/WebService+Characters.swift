//
//  WebService+Category.swift
//  TheBreakingBad
//
//  Created by AvanticaMAC2 on 1/28/21.
//

import Foundation

extension WebService {
    
    static func requestCharacters(completion: @escaping ResultCompletion<[Character], Error>) {
        sendRequest(pathURL: Path.characters, method: HttpMethod.get) { (result: Result<[Character], Error>) in
            
            if case .success(let character) = result {
                print(character)
            }
            
            completion(result)
        }
    }
    
    
}
