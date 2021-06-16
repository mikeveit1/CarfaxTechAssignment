//
//  DataService.swift
//  CarfaxTechAssignment
//
//  Created by Michael Veit on 6/16/21.
//

import Foundation
class DataService {
    static let shared = DataService()
    
    func getData(completion: (Data) -> Void, errorHandler: (Error) -> Void) {
        guard let path =  URL(string: "https://carfax-for-consumers.firebaseio.com/assignment.json") else { return }
        
        let url = path
        
        do {
            let data = try Data(contentsOf: url)
            completion(data)
        } catch {
            errorHandler(error)
        }
    }
}
