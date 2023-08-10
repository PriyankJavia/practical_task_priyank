
import Foundation
import UIKit
import CoreData

class DatabaseManager{
    static let shared = DatabaseManager()
    let viewContext = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext
    
    //Save the data
    func saveData(userData : SignupModel){
        do{
            let signupPreference = SignupDetails(context: viewContext!)
            signupPreference.id = userData.id
            signupPreference.fullName = userData.fullName
            signupPreference.email = userData.email
            signupPreference.city = userData.city
            signupPreference.gender = userData.gender
            signupPreference.phoneNo = Int64(userData.phoneNo) ?? 0
            signupPreference.password = userData.password
            try self.viewContext?.save()
        }catch{
            debugPrint("save userData task failed", error)
        }
    }
    
    //Fetch the data
    func fetchData() -> SignupDetails?{
        do{
            let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: CoreDataAttributeKeys.signupDetailsEntityName)
            let sortingByID = NSSortDescriptor(key: CoreDataAttributeKeys.signupUserDataID, ascending:true)
            fetchRequest.sortDescriptors = [sortingByID]
            let result = try? viewContext?.fetch(fetchRequest) as? [SignupDetails]
            return result?.first
        }
    }
    
    //Update the data
    func updateData(userData : SignupModel){
        do {
            
            let fetchRequest = NSFetchRequest<SignupDetails>(entityName: CoreDataAttributeKeys.signupDetailsEntityName)
            fetchRequest.predicate = NSPredicate(format: "\(CoreDataAttributeKeys.signupUserDataID) == %@", userData.id )
            
            let arrUserData = try self.viewContext?.fetch(fetchRequest)
              
            if arrUserData?.count ?? 0 > 0 {
                let objExistingData = arrUserData?.first!
                objExistingData?.id = userData.id
                objExistingData?.fullName = userData.fullName
                objExistingData?.email = userData.email
                objExistingData?.city = userData.city
                objExistingData?.gender = userData.gender
                objExistingData?.phoneNo = Int64(userData.phoneNo) ?? 0
                objExistingData?.password = userData.password
            }
            try self.viewContext?.save()
        }
        catch {
            debugPrint("fetch userData task failed", error)
        }
    }
}


struct CoreDataAttributeKeys{
    static let signupDetailsEntityName = "SignupDetails"
    static let signupUserDataID = "id"
}
