import SwiftUI

struct ContentView: View {
  
  @State private var musicItems: [MusicItem] = []
  
  var body: some View {
    VStack {
      Button(action: fetchMusic) {
        Text("Fetch Music")
      }
      List(musicItems) { item in
        Text(item.trackName)
      }
      Spacer()
    }
  }
  
  func fetchMusic() {
    guard let url =  URL(string:"https://itunes.apple.com/search?media=music&entity=song&term=cohen") else {
      return
    }
    
      let configuration = URLSessionConfiguration.default
      let session = URLSession(configuration: configuration)
     
      let task = session.dataTask(with: url) {
          data, response, error in
          
          guard let data = data else {
              return
          }
          
          let decoder = JSONDecoder()
          
          guard let response = try? decoder.decode(MediaResponse.self, from: data) else {
            return
          }
          
          DispatchQueue.main.async {
            self.musicItems = response.results
          }
      }
      
      task.resume()
  }
}


struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
      ContentView()
  }
}
