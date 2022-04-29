//
//  WebService+Deaths.swift
//  TheBreakingBad
//
//  Created by AvanticaMAC2 on 1/28/21.
//

import Foundation

extension WebService {
    
    static func requestDeaths(completion: @escaping ResultCompletion<[DeathInformation], Error>) {
        sendRequest(pathURL: Path.deaths, method: HttpMethod.get) { (result: Result<[DeathInformation], Error>) in
            
            if case .success(let deaths) = result {
                print(deaths[0].cause)
            }
                        
            completion(result)
        }
    }
}
