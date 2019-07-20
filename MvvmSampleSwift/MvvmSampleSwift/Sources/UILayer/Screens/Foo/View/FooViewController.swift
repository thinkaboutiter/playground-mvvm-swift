//
//  FooViewController.swift
//  MvvmSampleSwift
//
//  Created by Boyan Yankov on 2019-W29-21-Jul-Sun.
//  Copyright © 2019 boyankov@yahoo.com. All rights reserved.
//

import UIKit
import SimpleLogger

class FooViewController: BaseViewController, FooViewModelConsumer {
    
    // MARK: - Properties
    private let viewModel: FooViewModel
    
    // MARK: - Initialization
    @available(*, unavailable, message: "Creating this view controller with `init(coder:)` is unsupported in favor of initializer dependency injection.")
    required init?(coder aDecoder: NSCoder) {
        fatalError("Creating this view controller with `init(coder:)` is unsupported in favor of dependency injection initializer.")
    }
    
    @available(*, unavailable, message: "Creating this view controller with `init(nibName:bundle:)` is unsupported in favor of initializer dependency injection.")
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        fatalError("Creating this view controller with `init(nibName:bundle:)` is unsupported in favor of dependency injection initializer.")
    }
    
    deinit {
        Logger.fatal.message()
    }
    
    // MARK: - FooViewModelConsumer protocol
    required init(viewModel: FooViewModel) {
        self.viewModel = viewModel
        super.init(nibName: String(describing: FooViewController.self), bundle: nil)
        self.viewModel.setViewModelConsumer(self)
        Logger.success.message()
    }
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    // MARK: - Actions
    @IBAction func dismissButton_touchUpInside(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
}
