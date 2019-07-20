//
//  InitialViewController.swift
//  MvvmSampleSwift
//
//  Created by Boyan Yankov on 2019-W29-20-Jul-Sat.
//  Copyright © 2019 boyankov@yahoo.com. All rights reserved.
//

import UIKit
import SimpleLogger

class InitialViewController: BaseViewController, InitialViewModelConsumer {
    
    // MARK: - Properties
    private let viewModel: InitialViewModel
    private let fooVCFactory: () -> FooViewController
    
    // MARK: - Initialization
    @available(*, unavailable, message: "Creating this view controller with `init(coder:)` is unsupported in favor of initializer dependency injection.")
    required init?(coder aDecoder: NSCoder) {
        fatalError("Creating this view controller with `init(coder:)` is unsupported in favor of dependency injection initializer.")
    }
    
    @available(*, unavailable, message: "Creating this view controller with `init(nibName:bundle:)` is unsupported in favor of initializer dependency injection.")
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        fatalError("Creating this view controller with `init(nibName:bundle:)` is unsupported in favor of dependency injection initializer.")
    }
    
    init(viewModel: InitialViewModel,
         fooVCFactory: @escaping () -> FooViewController)
    {
        self.viewModel = viewModel
        self.fooVCFactory = fooVCFactory
        super.init(nibName: String(describing: InitialViewController.self), bundle: nil)
        self.viewModel.setViewModelConsumer(self)
        Logger.success.message()
    }
    
    deinit {
        Logger.fatal.message()
    }
    
    // MARK: - InitialViewModelConsumer protocol
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    // MARK: - Actions
    @IBAction func showFooScreenButton_touchUpInside(_ sender: Any) {
        let vc: FooViewController = self.fooVCFactory()
        self.present(vc, animated: true, completion: nil)
    }
}
