//
//  SignInViewController.swift
//  covidTracker





import UIKit
import FirebaseAuth

class SignInViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var fullNameText: UITextField!
    @IBOutlet weak var emailText: UITextField!
    @IBOutlet weak var passwordText: UITextField!
    @IBOutlet weak var signIn: UIButton!
    
    private let seguleString: String = "goToLogin"
    var isEmailSet:Bool = false
    var isPasswordSet:Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.emailText.delegate = self
        self.passwordText.delegate = self
        signIn.isEnabled = false
        
        //keyboard event listeners
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @IBAction func onCancleBtnPress(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true, completion: nil)
    }
    @IBAction func onSignInButtonPress(_ sender: UIButton) {
        createUser()
    }
    
    //helper fuctions
    private func showAlert(title:String?, message:String?) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okButton = UIAlertAction(title: "Ok", style: .default)
        
        alert.addAction(okButton)
        self.show(alert, sender: nil)
    }
    
    private func createUser() {
        let email = emailText.text ?? ""
        let password = passwordText.text ?? ""

        print("Email: \(email)")
        print("Pwd : \(password)")
        
        Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
            
            if let error = error {
                self.showAlert(title: "Registeration Error", message: "Please check your Email")
                return
            }

            self.performSegue(withIdentifier: self.seguleString, sender: self)
        }
    }
    
    //UITextFieldDelegate functions
    @objc func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            if self.view.frame.origin.y == 0 {
                self.view.frame.origin.y -= keyboardSize.height
            }
        }
    }

    @objc func keyboardWillHide(notification: NSNotification) {
        if self.view.frame.origin.y != 0 {
            self.view.frame.origin.y = 0
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
    
    //loginButton visibility
    @IBAction func onEmailEditing(_ sender: UITextField) {
        if emailText.text == "" {
            isEmailSet=false
            signIn.isEnabled=false
        } else {
            isEmailSet=true
        }
        
        if isPasswordSet==true && isEmailSet==true {
            signIn.isEnabled=true
        }
    }
    
    @IBAction func onPasswordEditing(_ sender: UITextField) {
        if passwordText.text == "" {
            isPasswordSet = false
            signIn.isEnabled=false
        } else {
            isPasswordSet=true
        }
         
         if isPasswordSet==true && isEmailSet==true {
             signIn.isEnabled=true
         }
    }

}
