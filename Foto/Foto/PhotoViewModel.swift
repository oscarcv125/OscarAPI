
import Foundation

@MainActor
@Observable
class ViewModelPhoto{
    var arrPhotos = [Photo]()
    
    func getPhotos() async throws{
        //1. url
        guard let url = URL(string: "https://api.nasa.gov/planetary/apod?api_key=PT8d5aeLjXeVJSoLrVMEb3qXHOvBbmnXFp0KEiDY&count=10")
        else{
            print("error")
            return}
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "GET"
        
        let (data,response) = try await URLSession.shared.data(for:urlRequest)
        
        guard(response as? HTTPURLResponse)?.statusCode == 200 else{
            print("error")
            return
        }
        
        let results = try JSONDecoder().decode([Photo].self, from: data)
        
        self.arrPhotos = results
    }
}
