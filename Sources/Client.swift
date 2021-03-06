//
//  Client.swift
//  https://github.com/Pimine/Mailer
//
//  This code is distributed under the terms and conditions of the MIT license.
//  Copyright (c) 2020 Pimine
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in all
//  copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
//  SOFTWARE.

import Foundation

extension Mailer {
    public enum Client: String, CaseIterable {
        
        // MARK: - Predefined clients
        
        case sparrow = "Sparrow"
        case gmail = "Gmail"
        case dispatch = "Dispatch"
        case spark = "Spark"
        case airmail = "Airmail"
        case outlook = "Microsoft Outlook"
        case yahoo = "Yahoo Mail"
        case fastmail = "Fastmail"
        case apple = "Mail App"
        
        // MARK: - Helpers
        
        public var thirdPartyClient: ThirdPartyMailClient? {
            guard
                let index = Client.allCases.firstIndex(of: self),
                self != .apple
            else { return nil }
            return ThirdPartyMailClient.clients()[index]
        }
    }
}
