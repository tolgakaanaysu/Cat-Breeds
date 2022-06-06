import SwiftUI

struct SplashView: View {
    @State var isActive:Bool = false
    var body: some View {
        VStack{
            if isActive {
                HomeView()
                    .environmentObject(ViewModel())
            }
            else{                
                Image("catImage")
                    .frame(width: getScreenBoundsWith() * 0.5, height: getScreenBoundsWith() * 0.5, alignment: .center)
                    
                Text("Cat Breed")
                    .font(Font.largeTitle)
                
            }
        }//: VStack
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                withAnimation {
                    self.isActive = true
                }
            }
        }
    }
}

struct SplashView_Previews: PreviewProvider {
    static var previews: some View {
        SplashView()
    }
}
