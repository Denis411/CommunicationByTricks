//
//  ThirdVC.swift
//  ResponderForNVC
//
//  Created by Dennis on 4/23/22.
//

import UIKit

class ThirdVC: UIViewController, CenteredButton {
    typealias vc = ThirdVC
    var centeredButton = UIButton()
    private let confirmButton = UIButton()
    private let textField = UITextField()
    private let dismissButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .lightGray
        setUpPresentingButton()
        setUpTextField()
        setUpConfirmButton()
        setUpDismissButton()
    }
    
    deinit {
        print("Deallocation ThirdVC")
    }
    
    private func setUpTextField() {
        textField.layer.backgroundColor = UIColor.yellow.cgColor
        textField.textColor = .black
        textField.placeholder = "Text to convey"
        textField.textAlignment = .center
        textField.becomeFirstResponder()
        
        view.addSubview(textField)
        textField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            textField.heightAnchor.constraint(equalToConstant: 35),
            textField.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width * 0.75),
            textField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            textField.topAnchor.constraint(equalTo: self.navigationController?.navigationBar.bottomAnchor ?? view.safeAreaLayoutGuide.topAnchor, constant: 50)
        ])
    }
    
    private func setUpPresentingButton() {
        addCenteredButton(vc: self)
        centeredButton.setTitle("Present VC", for: .normal)
        centeredButton.setTitle("OK", for: .highlighted)
        centeredButton.addTarget(self, action: #selector(PresenterSelf), for: .touchUpInside)
    }
    
    private func setUpConfirmButton() {
        confirmButton.backgroundColor = .orange
        confirmButton.layer.cornerRadius = 20
        confirmButton.setTitle("Confirm", for: .normal)
        confirmButton.setTitle("OK", for: .highlighted)
        
        view.addSubview(confirmButton)
        confirmButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            confirmButton.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width * 0.75),
            confirmButton.heightAnchor.constraint(equalToConstant: 50),
            confirmButton.topAnchor.constraint(equalTo: textField.bottomAnchor, constant: 25),
            confirmButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        confirmButton.addTarget(self, action: #selector(ConfirmEnteredText), for: .touchUpInside)
    }
    
    private func setUpDismissButton() {
        dismissButton.layer.backgroundColor = UIColor.red.cgColor
        dismissButton.layer.cornerRadius = 20
        dismissButton.setTitle("Dismiss self", for: .normal)
        dismissButton.setTitle("OK", for: .highlighted)
        
        view.addSubview(dismissButton)
        dismissButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            dismissButton.heightAnchor.constraint(equalToConstant: 50),
            dismissButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.75),
            dismissButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            dismissButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -50)
        ])
        
        dismissButton.addTarget(self, action: #selector(dismissSelf), for: .touchUpInside)
    }
    
    @objc private func PresenterSelf() {
        let vc = ThirdVC()
        present(vc, animated: true, completion: nil)
    }
    
    @objc private func ConfirmEnteredText() {
        let nv = UIApplication.shared.windows.first?.rootViewController as! UINavigationController
        let topVC = nv.viewControllers.last as? SecondVC
        guard let text = textField.text else {
            dismiss(animated: true, completion: nil)
            return
        }
        
        topVC?.setNew(text: text)
        dismiss(animated: true, completion: nil)
    }
    
    @objc private func dismissSelf() {
        dismiss(animated: true, completion: nil)
    }
}

