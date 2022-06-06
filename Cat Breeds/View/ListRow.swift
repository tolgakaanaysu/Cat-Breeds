import SwiftUI
import Kingfisher

struct ListRow: View {
    var cat: CatsModel
    
    var body: some View {        
        HStack(spacing:20){
            KFImage(URL(string: cat.image?.url ?? ""))
                .cancelOnDisappear(true)
                .placeholder{
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
                .frame(width:  getScreenBoundsHeight() * 0.06,
                       height: getScreenBoundsHeight() * 0.06,
                       alignment: .center)
            
            Text(cat.name)
            Spacer()
            FavoriteButton(catDetails: cat)
                .frame(width: getScreenBoundsHeight() * 0.035 ,
                       height: getScreenBoundsHeight() * 0.035)
            
            
        }
        .frame(height: getScreenBoundsHeight() * 0.075)
    }
}

struct ListRow_Previews: PreviewProvider {
    static var previews: some View {
        ListRow(cat: cat1)
            .environmentObject(ViewModel())
    }
}
