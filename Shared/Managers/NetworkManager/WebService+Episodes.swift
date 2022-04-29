//
//  WebService+Episodes.swift
//  TheBreakingBad
//
//  Created by AvanticaMAC2 on 1/28/21.
//

import Foundation

extension WebService {
    
    static func requestEpisodes(completion: @escaping ResultCompletion<[Episode], Error>) {
        sendRequest(pathURL: Path.episodes, method: HttpMethod.get) { (result: Result<[Episode], Error>) in

            if case .success(let episodes) = result {
                print(episodes[0].title)
            }

            completion(result)
        }
    }
    

}
