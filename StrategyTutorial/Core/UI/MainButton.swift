//
//  MainButton.swift
//  StrategyTutorial
//
//  Created by Ahmed Ramy on 21/12/2021.
//

import UIKit

final class MainButton: UIButton {
    var onTap: (() -> Void)?
    override var buttonType: UIButton.ButtonType { .system }
    
    init(title: String) {
        super.init(frame: .zero)
        setTitle(title, for: .normal)
        addTarget(self, action: #selector(didTap), for: .touchUpInside)
        backgroundColor = .systemBlue
        layer.cornerRadius = 16
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}

private extension MainButton {
    @objc func didTap() {
        onTap?()
    }
}
