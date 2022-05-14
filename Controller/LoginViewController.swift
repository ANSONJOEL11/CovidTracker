//
//  ViewController.swift
//  covidTracker



import UIKit
import FirebaseAuth


class LoginViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var emailText: UITextField!
    @IBOutlet weak var passwordText: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    
    
    
    private let welcomeString: String = "goToTabs"
    var isEmailSet:Bool = false
    var isPasswordSet:Bool = false

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.emailText.delegate = self
        self.passwordText.delegate = self
        loginButton.isEnabled = false
        
        //keyboard event listeners
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }


    @IBAction func onLoginBtnTapped(_ sender: UIButton) {
        print("Login....")
        authenticate()
        
    }
    
    //------------------------------
    //helper fuctions
    private func showAlert(title:String?, message:String?) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okButton = UIAlertAction(title: "Ok", style: .default)
        
        alert.addAction(okButton)
        self.show(alert, sender: nil)
        
    }
    
    private func authenticate() {

        let email = emailText.text ?? ""
        let password = passwordText.text ?? ""

        print("Email: \(email)")
        print("Pwd : \(password)")

        Auth.auth().signIn(withEmail: email, password: password) { [weak self] authResult, error in
          guard let strongSelf = self else { return }

            if let error = error {
                strongSelf.showAlert(title: "Authentication Error", message: "Please check your Email or Password")
                return
            }

            strongSelf.performSegue(withIdentifier: strongSelf.welcomeString, sender: strongSelf)
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
            loginButton.isEnabled=false
        } else {
            isEmailSet=true
        }
        
        if isPasswordSet==true && isEmailSet==true {
            loginButton.isEnabled=true
        }
    }
    
    @IBAction func onPasswordEditing(_ sender: UITextField) {
        if passwordText.text == "" {
            isPasswordSet = false
            loginButton.isEnabled=false
        } else {
            isPasswordSet=true
        }
         
         if isPasswordSet==true && isEmailSet==true {
             loginButton.isEnabled=true
         }
    }
    
}

