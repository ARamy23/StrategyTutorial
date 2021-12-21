//
//  RegisterViewController.swift
//  StrategyTutorial
//
//  Created by Ahmed Ramy on 21/12/2021.
//

import Foundation
import SnapKit

final class RegisterViewController: BaseViewController, HasViewModel {
    var viewModel: RegisterViewModel?
    
    override func loadView() {
        super.loadView()
        let emailTF = MainTextField()
        emailTF.placeholder = "Email"
        
        let passwordTF = MainTextField()
        passwordTF.placeholder = "Password"
        
        let confirmPasswordTF = MainTextField()
        confirmPasswordTF.placeholder = "Confirm Password"
        
        emailTF.onUpdate = { [weak self] value in
            self?.viewModel?.email.value = value
        }
        
        passwordTF.onUpdate = { [weak self] value in
            self?.viewModel?.password.value = value
        }
        
        confirmPasswordTF.onUpdate = { [weak self] value in
            self?.viewModel?.confirmPassword.value = value
        }
        
        let registerButton = MainButton(title: "Register")
        registerButton.onTap = { [weak self] in
            self?.viewModel?.register()
        }
        
        let containerView = UIView()
        containerView.backgroundColor = .white
        view = containerView
        
        let mainStack = UIStackView(
            arrangedSubviews: [
                emailTF,
                passwordTF,
                confirmPasswordTF,
                registerButton
            ],
            axis: .vertical,
            spacing: 16,
            alignment: .fill,
            distribution: .fill
        )
        
        mainStack.setLayoutMargin(.all(24))
        
        containerView.addSubview(mainStack)
        
        mainStack.snp.makeConstraints {
            $0.top.leading.trailing.equalToSuperview()
        }
        
        [
            emailTF,
            passwordTF,
            confirmPasswordTF,
            registerButton
        ].forEach {
            $0.snp.makeConstraints { $0.height.equalTo(45) }
        }
    }
}
