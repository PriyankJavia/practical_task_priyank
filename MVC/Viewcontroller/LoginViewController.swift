

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var txtPhoneOrEmail: UITextField!
    var userData : SignupDetails?
    override func viewDidLoad() {
        super.viewDidLoad()
        let fetchedData = DatabaseManager.shared.fetchData()
        // Do any additional setup after loading the view.
    }
    

    @IBAction func btnLoginTapped(_ sender: Any) {
        let fetchedData = DatabaseManager.shared.fetchData()
        if ((txtPhoneOrEmail.text == fetchedData?.email ?? "") || (txtPhoneOrEmail.text == "\(fetchedData?.phoneNo ?? 0)")) && txtPassword.text == fetchedData?.password ?? ""{
            APPDEL.setTabbarAsARoot()
            UserDefaultManager.shared.isLogin = true
        }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
