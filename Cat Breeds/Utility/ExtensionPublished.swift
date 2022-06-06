import Foundation
import Combine

// To use userDefaults with @Published
// To save and fetch in local memory
private var cancellableSet: Set<AnyCancellable> = []
extension Published where Value: Codable {
    init(wrappedValue defaultValue: Value, key: String) {
        if let data = UserDefaults.standard.data(forKey: key) {
            do {
                let value = try JSONDecoder().decode(Value.self, from: data)
                self.init(initialValue: value)
            } catch {
                print("Error while deconding user data")
                self.init(initialValue: defaultValue)
            }
        } else {
            self.init(initialValue: defaultValue)
        }
        projectedValue
            .sink { val in
                do {
                    let data = try JSONEncoder().encode(val)
                    UserDefaults.standard.set(data, forKey: key)
                } catch {
                    print("Error while decoding user data")
                }
            }
            .store(in: &cancellableSet)
    }
}
