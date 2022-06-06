import SwiftUI

struct HomeView: View {
    @EnvironmentObject var viewModel: ViewModel
    @State var searchText = ""
    
    var body: some View {
        NavigationView {
            VStack{
                SearchView()
                List(viewModel.catsList){ cat in
                        NavigationLink {
                            DetailsView(cat: cat)
                                .buttonStyle(BorderlessButtonStyle())

                        } label: {
                            ListRow(cat: cat)
                                .buttonStyle(PlainButtonStyle())

                        }
                }//: List
                .padding(.top,15)
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        Text("Cat Breed")
                            .bold()
                            .font(Font.largeTitle)
                           
                    }
                    ToolbarItem(placement: .navigationBarTrailing) {
                        NavigationLink {
                            MyFavorites()
                                
                        } label: {
                            Image(systemName: "heart.fill")
                                .foregroundColor(.red)
                        }
                    }
                }//: toolbar
                
            }//: VStack
            .listStyle(PlainListStyle())
            .navigationBarTitleDisplayMode(.inline)
            
        }//: NavigationView
       
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .environmentObject(ViewModel())
    }
}
