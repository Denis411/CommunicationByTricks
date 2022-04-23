//
//  CenteredButtonProtocol.swift
//  ResponderForNVC
//
//  Created by Dennis on 4/23/22.
//

import UIKit

protocol CenteredButton {
    associatedtype vc: UIViewController
    var centeredButton: UIButton { get }
    func addCenteredButton(vc: vc)
}

extension CenteredButton {
    func addCenteredButton(vc: vc) {
        centeredButton.layer.cornerRadius = 20
        centeredButton.layer.backgroundColor = UIColor.blue.cgColor
        centeredButton.setTitle("Push new vc", for: .normal)
        
        centeredButton.translatesAutoresizingMaskIntoConstraints = false
        vc.view.addSubview(centeredButton)
        NSLayoutConstraint.activate([
            centeredButton.heightAnchor.constraint(equalToConstant: 50),
            centeredButton.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width * 0.75),
            centeredButton.centerYAnchor.constraint(equalTo: vc.view.centerYAnchor),
            centeredButton.centerXAnchor.constraint(equalTo: vc.view.centerXAnchor)
        ])
    }
}
