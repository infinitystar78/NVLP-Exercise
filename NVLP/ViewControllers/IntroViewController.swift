//
//  IntroViewController.swift
//  NVLP
//
//  Created by Melvin Wijenayaka on 17/10/2020.
//

import UIKit
import SwiftyJSON
import KRProgressHUD


class IntroViewController: UIViewController ,UITextFieldDelegate {
    
    
    private let chartModel = ChartViewModel()

    @IBOutlet weak var healthCheckLabel: UILabel!{
        didSet{
            healthCheckLabel.attributedText = NSAttributedString(string: "Network Status", attributes: [NSAttributedString.Key.font :UIFont.subHeadingFont, NSAttributedString.Key.foregroundColor : UIColor.systemBlue])
        }
    }
    @IBOutlet weak var healthCheckIndicatorView: UIView! {
        didSet{
            healthCheckIndicatorView.makeCircular()
        }
    }
    @IBOutlet weak var welcomeTitle: UILabel!{
        didSet{
            welcomeTitle.attributedText = NSAttributedString(string: "Welcome", attributes: [NSAttributedString.Key.font :UIFont.mainHeading, NSAttributedString.Key.foregroundColor : UIColor.systemPink])
        }
    }
    
    @IBOutlet weak var emailAddressLabel: UILabel!{
        didSet{
            emailAddressLabel.attributedText = NSAttributedString(string: "Enter Email Address", attributes: [NSAttributedString.Key.font :UIFont.subHeadingFont, NSAttributedString.Key.foregroundColor : UIColor.label])
        }
    }
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var nextButton: UIButton!{
        didSet{
            nextButton.setAttributedTitle(NSAttributedString(string: "NEXT", attributes: [NSAttributedString.Key.font :UIFont.buttonFont, NSAttributedString.Key.foregroundColor : UIColor.blue]), for: .normal)
        }
    }
    private var viewModel : IntroViewModel?
    @IBOutlet weak var emailErrorLabel: UILabel!
    private var emailError = Bool()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupView()
        viewModel = IntroViewModel()
        viewModel?.getHealthCheckStatus(completionHandler: { (success) in
            if success == true{
                DispatchQueue.main.async {
                    self.healthCheckIndicatorView.backgroundColor = .green
                }
                
            }else{
                self.healthCheckIndicatorView.backgroundColor = .red
            }
        })
        // Do any additional setup after loading the view.
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        viewModel?.emailAddress = textField.text
        viewModel?.validateEmailAddress(completionHandler: { [weak self] (success) in
            guard let self = self else { return }
            if success == true{
                self.displayErrorMessage(error: false)
            }else{
                self.displayErrorMessage(error: true)
            }
        })
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    fileprivate func displayErrorMessage(error:Bool){
        DispatchQueue.main.async {
            if error == true{
                self.emailErrorLabel.attributedText = NSAttributedString(string: "Incorrect Email Format !", attributes: [NSAttributedString.Key.font :UIFont.subHeadingFont, NSAttributedString.Key.foregroundColor : UIColor.red])
                self.emailError = true
            }else{
                self.emailErrorLabel.text = ""
                self.emailError = false
                self.nextButton.alpha = 1
                self.nextButton.isEnabled = true
            }
        }
    }
    
    fileprivate func setupView(){
        self.emailTextField.delegate = self
        self.nextButton.alpha = 0.2
        self.nextButton.isEnabled = false
        
    }
    
    
    @IBAction func dismissKeyboard(_ sender: Any) {
       _ = self.emailTextField.resignFirstResponder()
        
    }
    
    
    @IBAction func nextScreen(_ sender: Any) {
        connectToServerSentEventsServer()
    }
    
    func connectToServerSentEventsServer(){
        viewModel?.getToken(completionHandler: { (success) in
            DispatchQueue.main.async {
                KRProgressHUD.show()
            }
            if success == true{
                DispatchQueue.main.async {
                   KRProgressHUD.dismiss()
                    self.performSegue(withIdentifier: "next", sender: self)
                }

            }
          
        })
    }

}



