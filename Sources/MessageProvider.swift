//
//  MessageProvider.swift
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

public protocol MessageProvider {
    var info: String { get }
    var cancel: String { get }
    var somethingWentWrong: String { get }
    var chooseMailClient: String { get }
    var noMailClients: String { get }
    var mailClientNotAvailable: String { get }
}

public struct DefaultMessageProvider: MessageProvider {
 
    public var info: String = "Info"
    public var cancel: String = "Cancel"
    public var somethingWentWrong: String = "Something went wrong. Please try again. If the problem persists, contact support."
    public var chooseMailClient: String = "Choose mail client"
    public var noMailClients: String = "There is no available mail clients for this device."
    public var mailClientNotAvailable: String  = "Mail client not available for this device."
    
    public init() { }
}
