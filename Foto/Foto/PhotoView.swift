

import SwiftUI

struct PhotoView: View {
    
    @State var photoVM = ViewModelPhoto()
    
    var body: some View {
        VStack{
            List{
                ForEach(photoVM.arrPhotos){item in
                    Text(item.title)
                    AsyncImage(url: URL(string: item.url!))
                }
            }
            .task {
                do {
                    try await photoVM.getPhotos()
                }catch{
                    print("No fotos")
                }
            }
        }
    }
}

#Preview {
    PhotoView()
}

