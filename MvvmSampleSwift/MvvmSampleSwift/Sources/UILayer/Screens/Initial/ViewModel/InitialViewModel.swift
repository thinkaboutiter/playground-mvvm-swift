//
//  InitialViewModel.swift
//  MvvmSampleSwift
//
//  Created by Boyan Yankov on 2019-W29-20-Jul-Sat.
//  Copyright © 2019 boyankov@yahoo.com. All rights reserved.
//

import Foundation
import SimpleLogger

/// Functionality for `View` object to implement
protocol InitialViewModelConsumer: AnyObject {
    init(viewModel: InitialViewModel)
}

/// Functionality for `ViewModel` object to implement and expose to `View` object
protocol InitialViewModel: AnyObject {
    func setViewModelConsumer(_ newValue: InitialViewModelConsumer)
}

class InitialViewModelImpl: InitialViewModel {
    
    // MARK: - Properties
    private weak var viewModelConsumer: InitialViewModelConsumer!
    
    // MARK: - Initialization
    init() {
        Logger.success.message()
    }
    
    deinit {
        Logger.fatal.message()
    }
    
    // MARK: - InitiaViewModel protocol
    func setViewModelConsumer(_ newValue: InitialViewModelConsumer) {
        self.viewModelConsumer = newValue
    }
}

