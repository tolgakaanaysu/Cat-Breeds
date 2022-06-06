import Foundation
import SwiftUI

class ViewModel: ObservableObject {
    @Published var catsList: [CatsModel] = []
    @Published(key: "favoriteList") var favoriteList: [CatsModel] = []
    
    init(){
        fetchData()
    }

}

extension ViewModel{
    func loadData(searchText: String?){
        if let searchString = searchText {
            fetchDataWithSearch(searchText: searchString)
        }else {
            fetchData()     
        }
           
    }
}

extension ViewModel {
    private func fetchData(){
        catsList.removeAll(keepingCapacity: true)
        let urlString = "https://api.thecatapi.com/v1/breeds?attach_breed=0"
        WebService().downloadData(urlString: urlString, completion: { result in
            switch result {
            case .failure(let error):
                print(error)
            case .success(let cat):
                if let cat = cat {
                    DispatchQueue.main.async {
                        self.catsList.append(contentsOf: cat)
                    }
                }
            }
        })
    }
}

extension ViewModel {
    private func fetchDataWithSearch(searchText: String){
        catsList.removeAll(keepingCapacity: false)
        let urlString = "https://api.thecatapi.com/v1/breeds/search?q=\(searchText)"
        WebService().downloadData(urlString: urlString, completion: { result in
            switch result {
            case .failure(let error):
                print(error)
            case .success(let cat):
                if let cat = cat {
                    DispatchQueue.main.async {
                        self.catsList.append(contentsOf: cat)
                    }
                }
            }
        })
    }
}





// Check if is cat Favorite
extension ViewModel {
    func isFavorite(catDetails: CatsModel) -> Bool{
        for element in favoriteList {
            if element.id == catDetails.id {
                return true
            }
        }
        return false
    }
}



