import SwiftUI
import Kingfisher

struct DetailsView: View {
    var cat: CatsModel
    
    var body: some View {
        
        VStack(spacing: 15){
            KFImage(URL(string: cat.image?.url ?? ""))
                .placeholder {
                    if cat.image?.url != nil {
                        ProgressView()
                    }
                    else {
                        Image(systemName: "photo")
                            .imageScale(.large)
                            .foregroundColor(.gray)
                    }
                }
                .resizable()
                .frame(width: getScreenBoundsWith() * 0.9,
                       height: getScreenBoundsHeight() * 0.4,
                       alignment: .center)
            
            VStack(alignment: .leading, spacing: 15){
                
                Text(cat.description)
                
                Text("Origin: \(cat.origin)")
                
                Text("Vikipedia Url: \(cat.wikipedia_url ?? "No URL Data" )")
                
            }
            .navigationTitle(cat.name)
            Spacer()
                
            
        }//: Vstack
        .padding()
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                FavoriteButton(catDetails: cat)
            }
        }
    }
}

struct DetailsView_Previews: PreviewProvider {
    static var previews: some View {
        DetailsView(cat: cat1)
        
    }
}
