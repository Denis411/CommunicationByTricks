//
//  SecondVC.swift
//  ResponderForNVC
//
//  Created by Dennis on 4/23/22.
//

import UIKit

class SecondVC: UIViewController, CenteredButton {
    typealias vc = SecondVC
    var centeredButton: UIButton = UIButton()
    var myLabel: UILabel = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .cyan
        setUpButton()
        setUpLabel()
    }
    
    deinit {
        print("Deallocation SecondVC")
    }
    
    func setUpButton() {
        addCenteredButton(vc: self)
        centeredButton.setTitle("Pop up VC", for: .normal)
        centeredButton.addTarget(self, action: #selector(popUpVC), for: .touchUpInside)
    }
    
    @objc private func popUpVC() {
        let vc = ThirdVC()
        present(vc, animated: true, completion: nil)
    }
    
    private func setUpLabel() {
        myLabel.layer.backgroundColor = UIColor.blue.cgColor
        myLabel.text = "🐱"
        myLabel.textColor = .white
        
        myLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(myLabel)
        
        NSLayoutConstraint.activate([
            myLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            myLabel.topAnchor.constraint(equalTo: centeredButton.bottomAnchor, constant: -100)
        ])
    }
    
    func setNew(text: String) {
        myLabel.text = text
    }
}
