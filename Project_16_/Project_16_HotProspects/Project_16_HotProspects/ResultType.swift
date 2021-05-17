//
//  ResultType.swift
//  Project_16_HotProspects
//
//  Created by kanishk vijaywargiya on 09/04/21.
//

import SwiftUI

enum NetworkError: Error {
    case badURL, requestFailed, unknown
}

struct ResultType: View {
    var body: some View {
        Text("Hello, World!")
            .onAppear(){
                self.fetchData(from: "https://kanishkvijaywargiya.github.io/uicolorpicker.github.io/") { result in
                    switch result {
                    case .success(let str): print(str)
                    case .failure(let error):
                        switch error {
                        case .badURL:
                            print("Bad URL")
                        case .requestFailed:
                            print("Network Problem")
                        case .unknown:
                            print("Unknown error")
                        }
                    }
                }
            }
    }
    
    func fetchData(from urlString: String, completion: @escaping (Result<String, NetworkError>) -> Void) {
        guard let url = URL(string: urlString) else {
            completion(.failure(.badURL))
            return
        }
        
        URLSession.shared.dataTask(with: url){ data, response, error in
            // task has completed - push our work back to main thread.
            DispatchQueue.main.async {
                if let data = data {
                    // success: convert the data to a string & send it back
                    let stringData = String(decoding: data, as: UTF8.self)
                    completion(.success(stringData))
                } else if error != nil {
                    // any sort of N/W failure
                    completion(.failure(.requestFailed))
                } else {
                    // when net is not avail or api call (rare condition)
                    completion(.failure(.unknown))
                }
            }
        }.resume()
    }
}

struct ResultType_Previews: PreviewProvider {
    static var previews: some View {
        ResultType()
    }
}
