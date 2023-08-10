

import Foundation
import CoreData


extension SignupDetails {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<SignupDetails> {
        return NSFetchRequest<SignupDetails>(entityName: "SignupDetails")
    }

    @NSManaged public var id: Int64
    @NSManaged public var fullName: String?
    @NSManaged public var email: String?
    @NSManaged public var phoneNo: Int64
    @NSManaged public var city: String?
    @NSManaged public var gender: String?
    @NSManaged public var password: String?

}
