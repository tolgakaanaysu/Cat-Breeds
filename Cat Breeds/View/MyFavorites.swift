import SwiftUI

    
struct MyFavorites: View {
    @EnvironmentObject var viewModel: ViewModel
    
    var body: some View {
        VStack{
            if viewModel.favoriteList.count == 0 {
                Text("Favorite List is Empty")
                    .frame(width: getScreenBoundsWith() * 0.85,
                           height: 100,
                           alignment: .center)
                    .font(.largeTitle)
                    
            }
            else {
                List(viewModel.favoriteList, id:\.id){ cat in
                        NavigationLink {
                            DetailsView(cat: cat)
                                .buttonStyle(BorderlessButtonStyle())
                            
                                
                        } label: {
                            ListRow(cat: cat)
                                .buttonStyle(PlainButtonStyle())
                        }
                        
                }
                .navigationTitle("My Favorite")
                .listStyle(PlainListStyle())
                .navigationBarTitleDisplayMode(.inline)
            }
            
        }//:VStack
    }
}

struct MyFavorites_Previews: PreviewProvider {
    static var previews: some View {
        MyFavorites()
    }
}
