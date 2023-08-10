

import UIKit

class PeopleViewController: UIViewController {
    @IBOutlet weak var txtCity: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var txtPhoneNo: UITextField!
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtFullName: UITextField!
    
    @IBOutlet weak var btnMale: UIButton!
    @IBOutlet weak var btnFemale: UIButton!
    @IBOutlet weak var btnOther: UIButton!
    
    
    let radioController: RadioButtonController = RadioButtonController()
    var userGender = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupData()
        radioController.buttonsArray = [btnMale,btnFemale, btnOther]
        radioController.defaultButton = btnMale
        // Do any additional setup after loading the view.
    }
    
    func setupData(){
        let fetchedData = DatabaseManager.shared.fetchData()
        txtCity.text = fetchedData?.city
        txtEmail.text = fetchedData?.email
        txtPassword.text = fetchedData?.password
        txtPhoneNo.text = "\(fetchedData?.phoneNo ?? 0)"
        txtFullName.text = fetchedData?.fullName
        userGender = fetchedData?.gender ?? ""
    }
    
    @IBAction func btnLogoutTapped(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle:nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
        UIApplication.shared.windows.first?.rootViewController = vc
        UIApplication.shared.windows.first?.makeKeyAndVisible()
        UserDefaultManager.shared.isLogin = false
    }
    @IBAction func btnUpdateTapped(_ sender: Any) {
        let fetchedData = DatabaseManager.shared.fetchData()
        let signupData = SignupModel(id: fetchedData?.id ?? 0, fullName: txtFullName.text ?? "", email: txtEmail.text ?? "", phoneNo:
                                        txtPhoneNo.text ?? "", city: txtCity.text ?? "", gender: userGender, password: txtPassword.text ?? "")
        DatabaseManager.shared.updateData(userData: signupData)
        let alert = UIAlertController(title: "Profile", message: "Profile Updated!!", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
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
}
