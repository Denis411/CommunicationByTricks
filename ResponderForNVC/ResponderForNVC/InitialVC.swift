//
//  ViewController.swift
//  ResponderForNVC
//
//  Created by Dennis on 4/23/22.
//

import UIKit

class InitialVC: UIViewController, CenteredButton {
    typealias vc = InitialVC
    var centeredButton: UIButton = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .orange
        self.title = "Initial vc"
        setUpButton()
    }
    
    deinit {
        print("Deallocation InitialVC")
    }
    
    private func setUpButton() {
    addCenteredButton(vc: self)
    centeredButton.addTarget(self, action: #selector(pushNextVC), for: .touchUpInside)
    }
    
    @objc private func pushNextVC() {
        let vc = SecondVC()
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
