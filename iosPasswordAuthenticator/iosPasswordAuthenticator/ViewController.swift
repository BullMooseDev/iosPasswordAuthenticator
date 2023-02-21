import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var usernameTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    @IBOutlet var submitButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    //provides a true or false based on email input
    func checkEmailInfo() -> Bool{
        do {
            let pattern = #"^[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,4}$"#
            let emailRegex = try NSRegularExpression(pattern: pattern, options: .caseInsensitive)
            let textRange = NSRange(location: 0, length: usernameTextField.text!.count)
            if emailRegex.firstMatch(in: usernameTextField.text!, options: [], range: textRange) != nil {
                return true
            } else {
                return false
            }
        } catch let error {
            print(error.localizedDescription)
            return false
        }
    }
    
    //provides a true or false based on password input
    func checkPasswordInfo() -> Bool{
        do {
            let patttern = #"^(?=.*\d)(?=.*[A-Z])(?=.*[a-z])(?=.*[^\w\d\s:])([^\s]){8,16}$"#
            let passwordRegex = try NSRegularExpression(pattern: patttern)
            let textRange = NSRange(location: 0, length: passwordTextField.text!.count)
            if passwordRegex.firstMatch(in: passwordTextField.text!, range: textRange) != nil {
                return true
            } else {
                return false
            }
        } catch let error {
            print(error.localizedDescription)
            return false
        }
    }
    
    @IBAction func submitButttonPressed(_ sender: Any) {
        // check both textfields upon button press here\
        
        if checkEmailInfo() == true && checkPasswordInfo() == true {
            self.view.backgroundColor = .green
            
            //UIColor(red: 46, green: 204, blue: 113, alpha: 1)
        } else {
            view.backgroundColor = .red
            
            //UIColor(red: 255, green: 50, blue: 71, alpha: 1)
        }
    }
}
