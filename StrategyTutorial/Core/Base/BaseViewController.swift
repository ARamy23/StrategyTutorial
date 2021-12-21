//
//  BaseViewController.swift
//  StrategyTutorial
//
//  Created by Ahmed Ramy on 21/12/2021.
//

import UIKit

protocol HasViewModel {
    associatedtype ViewModelType: ViewModelable
    var viewModel: ViewModelType? { get set }
}

class BaseViewController: UIViewController {
    var viewWillAppearCalledBefore: Bool = false
    var viewDidAppearCalledBefore: Bool = false

    override public func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.backBarButtonItem = UIBarButtonItem(
            title: "",
            style: UIBarButtonItem.Style.plain,
            target: nil,
            action: nil
        )
    }

    override public func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if !viewWillAppearCalledBefore {
            viewWillAppearCalledBefore = true
            viewWillAppearOnce()
        }
    }

    override public func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if !viewDidAppearCalledBefore {
            viewDidAppearCalledBefore = true
            viewDidAppearOnce()
        }
    }

    open func viewWillAppearOnce() {
        /* Override in Children when needed */
    }

    open func viewDidAppearOnce() {
        /* Override in Children when needed */
    }

    open func showLoadingState(isLoading _: Bool) {
        /* Override in Children when needed */
    }
}

extension HasViewModel where Self: BaseViewController {
    func bindState() {
        viewModel?.error.subscribe {
            print($0)
        }
        
        viewModel?.successMessage.subscribe {
            print($0)
        }
        
        viewModel?.isLoading.subscribe {
            print($0)
        }
    }
}
