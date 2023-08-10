
import UIKit

class SignUpViewController: UIViewController {

    @IBOutlet weak var txtFullName: UITextField!
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtPhoneNumber: UITextField!
    @IBOutlet weak var txtCity: UITextField!
    
    @IBOutlet weak var btnMale: UIButton!
    @IBOutlet weak var btnFemale: UIButton!
    @IBOutlet weak var btnOther: UIButton!
    @IBOutlet weak var txtPassword: UITextField!
    
    
    @IBOutlet weak var btnSave: UIButton!
    
    var userGender = ""
    
    
    let radioController: RadioButtonController = RadioButtonController()
    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()

        radioController.buttonsArray = [btnMale,btnFemale, btnOther]
        radioController.defaultButton = btnMale
        
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func btnMaleTapped(_ sender: UIButton) {
        radioController.buttonArrayUpdated(buttonSelected: sender)
        userGender = "Male"
    }
    
    @IBAction func btnFemaleTapees(_ sender: UIButton) {
        radioController.buttonArrayUpdated(buttonSelected: sender)
        userGender = "Female"
    }
    
    @IBAction func btnOtherTapped(_ sender: UIButton) {
        radioController.buttonArrayUpdated(buttonSelected: sender)
        userGender = "Other"
    }
    
    
    @IBAction func btnSave(_ sender: Any) {
        let signupData = SignupModel(id: Int64(Date().timeIntervalSinceNow), fullName: txtFullName.text ?? "", email: txtEmail.text ?? "", phoneNo: txtPhoneNumber.text ?? "", city: txtCity.text ?? "", gender: userGender, password: txtPassword.text ?? "")
        DatabaseManager.shared.saveData(userData: signupData)
        UserDefaultManager.shared.isProfileCompleted = true
        UserDefaultManager.shared.isLogin = true
        
        APPDEL.setTabbarAsARoot()
    }
}
