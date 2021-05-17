//
//  UrlSessionSending&ReceivingCodableData.swift
//  Cupcake_1_
//
//  Created by kanishk vijaywargiya on 17/03/21.
//

import SwiftUI

struct Response: Codable{
    var results: [Result]
}

struct Result: Codable{
    var trackId: Int
    var trackName: String
    var collectionName: String
}

struct UrlSessionSending_ReceivingCodableData: View {
    @State var results = [Result]()
    
    var body: some View {
        List(results, id: \.trackId){item in
            VStack(alignment: .leading){
                Text(item.trackName)
                    .font(.headline)
                Text(item.collectionName)
            }
        }
        .onAppear(perform: loadData)
    }
    
    func loadData() {
        //  TODO: - 1...creating the URL we want to read
        guard let url=URL(string: "https://itunes.apple.com/search?term=taylor+swift&entity=song") else {
            print("Invalid URL")
            return
        }
        
        //  TODO: - 2...
        let requestUrl = URLRequest(url: url)
        
        //  TODO: - 3
        URLSession.shared.dataTask(with: requestUrl){ data,response,error in
            if let data = data{
                let decoder = JSONDecoder()
                if let decodeResponse = try? decoder.decode(Response.self, from: data) {
                    DispatchQueue.main.async {
                        self.results = decodeResponse.results
                    }
                    return
                }
            }
            print("Fetch failed: \(error?.localizedDescription ?? "Unknown Error")")
        }
        //  TODO: - 4
        .resume()
    }
}

struct UrlSessionSending_ReceivingCodableData_Previews: PreviewProvider {
    static var previews: some View {
        UrlSessionSending_ReceivingCodableData()
    }
}
