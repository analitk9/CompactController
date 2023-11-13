//
//  ViewController.swift
//  CompactController
//
//  Created by Denis Evdokimov on 11/13/23.
//

import UIKit

class ViewController: UIViewController {

    lazy var presentButton: UIButton = {
        let btn = UIButton(type: .roundedRect)
        btn.setTitle("Present", for: .normal)
        btn.addTarget(self, action: #selector(tapPresentButton), for: .touchUpInside)
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
        
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(presentButton)
        setupConstraint()
        
    }

    private func setupConstraint(){
        presentButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        presentButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50).isActive = true
        
    }

    @objc func tapPresentButton(_ sender: UIButton) {
        
        let compactViewController = CompactViewController()
        compactViewController.modalPresentationStyle = .popover
        
        let popoverVC = compactViewController.popoverPresentationController
        popoverVC?.sourceView = presentButton
        popoverVC?.permittedArrowDirections = .up
        popoverVC?.delegate = self
        present(compactViewController, animated: true)
        
    }
}
extension ViewController: UIPopoverPresentationControllerDelegate {
    func adaptivePresentationStyle(for controller: UIPresentationController) -> UIModalPresentationStyle {
        .none
    }
}

