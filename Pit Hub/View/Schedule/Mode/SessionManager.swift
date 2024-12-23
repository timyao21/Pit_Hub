//
//  SessionManager.swift
//  Pit Hub
//
//  Created by Junyu Yao on 12/15/24.
//

import Foundation

struct SessionManager {
    let circuitShortName: String
    let year: Int
    
    init(circuitShortName: String, year: Int) {
        self.circuitShortName = circuitShortName
        self.year = year
    }
    
    func getAllSessions(completion: @escaping ([Session]?) -> Void) {
        guard let url = URL(string: "https://api.openf1.org/v1/sessions?year=\(year)&circuit_short_name=\(circuitShortName)") else {
            print("Invalid URL")
            completion(nil)
            return
        }
    
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print("Error: \(error.localizedDescription)")
                completion(nil)
            }
            guard let data = data else {
                print("No data received")
                completion(nil)
                return
            }
            do {
                let sessions = try JSONDecoder().decode([Session].self, from: data)
                completion(sessions)
            } catch {
                print("Error decoding JSON: \(error)")
                completion(nil)
            }
        }.resume()
    }
    
}
