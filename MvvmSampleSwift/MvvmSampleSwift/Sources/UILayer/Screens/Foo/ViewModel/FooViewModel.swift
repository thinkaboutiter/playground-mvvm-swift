//
//  FooViewModel.swift
//  MvvmSampleSwift
//
//  Created by Boyan Yankov on 2019-W29-21-Jul-Sun.
//  Copyright © 2019 boyankov@yahoo.com. All rights reserved.
//

import Foundation
import SimpleLogger

/// Functionality for `View` object to implement
protocol FooViewModelConsumer: AnyObject {
    init(viewModel: FooViewModel)
}

/// Functionality for `ViewModel` object to implement and expose to `View` object
protocol FooViewModel: AnyObject {
    func setViewModelConsumer(_ newValue: FooViewModelConsumer)
}

class FooViewModelImpl: FooViewModel {
    
    // MARK: - Properties
    private weak var viewModelConsumer: FooViewModelConsumer!
    
    // MARK: - Initialization
    init() {
        Logger.success.message()
    }
    
    deinit {
        Logger.fatal.message()
    }
    
    // MARK: - FooViewModel protocol
    func setViewModelConsumer(_ newValue: FooViewModelConsumer) {
        self.viewModelConsumer = newValue
    }
}

