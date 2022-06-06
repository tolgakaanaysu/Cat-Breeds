import SwiftUI

struct FavoriteButton: View {
    @EnvironmentObject var viewModel: ViewModel
    var catDetails: CatsModel

    var body: some View {
        Button(action: {
            if !viewModel.isFavorite(catDetails: catDetails){
                viewModel.favoriteList.append(self.catDetails)
            }
            else {
                if let index = viewModel.favoriteList.firstIndex(where: {$0.id == catDetails.id }) {
                    viewModel.favoriteList.remove(at: index)
                }
            }            
        }){
            Image(systemName: "star.fill")
                .resizable()
                .foregroundColor( viewModel.isFavorite(catDetails: catDetails) ? Color.yellow: Color.secondary)
                
        }
    }
}
