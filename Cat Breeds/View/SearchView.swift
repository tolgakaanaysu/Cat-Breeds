import SwiftUI

struct SearchView: View {
    @EnvironmentObject var viewModel: ViewModel
    @State var searchText = ""
   
    var body: some View {
        HStack {
            TextField("Search", text: $searchText)
                .frame(width: getScreenBoundsWith() * 0.8 , height: 50)
                .border(.black)
                
            Spacer()
              
            Button {
                viewModel.loadData(searchText: searchText)
                
            } label: {
                Image(systemName: "magnifyingglass")
                    .resizable()
                    .frame(width: 30, height: 30, alignment: .center)
            }
        }
        .padding()
      
    }
}

struct SearchView_Previews: PreviewProvider {
    @State static var testBool: Bool = true
    static var previews: some View {
        SearchView()
    }
}
