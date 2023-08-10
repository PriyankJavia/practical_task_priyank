

import Foundation
class UserDefaultManager{
    static let shared = UserDefaultManager()
    let userDefault = UserDefaults.standard


    var isProfileCompleted : Bool{
        set{
            userDefault.set(newValue, forKey: #function)
            userDefault.synchronize()
        }
        get{
            return userDefault.value(forKey: #function) as? Bool ?? false
        }
    }
    
    var isLogin : Bool{
        set{
            userDefault.set(newValue, forKey: #function)
            userDefault.synchronize()
        }
        get{
            return userDefault.value(forKey: #function) as? Bool ?? false
        }
    }
}
