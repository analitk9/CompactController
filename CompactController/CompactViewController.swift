//
//  CompactViewController.swift
//  CompactController
//
//  Created by Denis Evdokimov on 11/14/23.
//

import UIKit

class CompactViewController: UIViewController {

    lazy var closeButton: UIButton = {
        let btn = UIButton(type: .close)
        btn.addTarget(self, action: #selector(closeTap), for: .touchUpInside)
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    lazy var segment: UISegmentedControl = {
        let segment = UISegmentedControl(items: ["280pt", "150pt"])
        segment.translatesAutoresizingMaskIntoConstraints = false
        segment.addTarget(self, action: #selector(changeSize), for: .valueChanged)
        segment.selectedSegmentIndex = 0
        segment.tintColor = .green
        return segment
        
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(closeButton)
        view.addSubview(segment)
        setPrefferedSize()
        setupConstraint()
    }
    
    
    private func setupConstraint(){
        segment.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        segment.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10).isActive = true
        
        closeButton.centerYAnchor.constraint(equalTo: segment.centerYAnchor).isActive = true
        closeButton.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -10).isActive = true
    }
    
    private func setPrefferedSize(){
        preferredContentSize = CGSize(width: 300, height: 280)
    }
    @objc func changeSize(_ sender: UISegmentedControl){
        if sender.selectedSegmentIndex == 0 {
            preferredContentSize.height = 280
        }else {
            preferredContentSize.height = 150
        }
    }
    
    @objc func closeTap() {
        dismiss(animated: true)
    }

}
