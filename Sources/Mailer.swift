//
//  Mailer.swift
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

import UIKit
import MessageUI

public class Mailer: NSObject {
    
    // MARK: - Properties
    
    var application: UIApplication {
        UIApplication.shared
    }
    
    // MARK: Initialization
    
    public let shared = Mailer()
    
    // MARK: - Helpers
    
    public func isClientAvailable(_ client: Client) -> Bool {
        switch client {
        case .apple:
            return MFMailComposeViewController.canSendMail()
        default:
            let thirdPartyClient = client.thirdPartyClient!
            return ThirdPartyMailer.application(application, isMailClientAvailable: thirdPartyClient)
        }
    }
    
    // MARK: - Public API
    
    public func sendMail(
        to recipient: String,
        with subject: String = "",
        body: String = "",
        clients: [Client] = Client.allCases
    ) {
        let availableClients = clients.filter { isClientAvailable($0) }
        if availableClients.count > 1 {
            openClientPicker(recipient: recipient, subject: subject, body: body, clients: availableClients)
        } else if availableClients.count > 0 {
            sendMail(to: recipient, with: subject, body: body, client: availableClients[0])
        } else {
            Alert.show(message: Messages.noMailClients)
        }
    }
    
    
    public func sendMail(
        to recipient: String,
        with subject: String = "",
        body: String = "",
        client: Client
    ) {
        guard isClientAvailable(client) else {
            return Alert.show(message: Messages.mailClientNotAvailable)
        }
        switch client {
        case .apple:
            let controller = MFMailComposeViewController()
            controller.setToRecipients([recipient])
            controller.mailComposeDelegate = self
            application.topViewController?.present(controller, animated: true)
        default:
            let opened = ThirdPartyMailer.application(
                application,
                openMailClient: client.thirdPartyClient!,
                recipient: recipient,
                subject: subject, body: body
            )
            if !opened { Alert.show(message: Messages.somethingWentWrong) }
        }
    }
    
    // MARK: - Private API
    
    private func openClientPicker(recipient: String, subject: String, body: String, clients: [Client]) {
        let clientPicker = UIAlertController(title: "Choose mail app", message: nil, preferredStyle: .actionSheet)
        for client in clients {
            let action = UIAlertAction(title: client.rawValue, style: .default) { _ in
                self.sendMail(to: recipient, with: subject, body: body, client: client)
            }
            clientPicker.addAction(action)
        }
        
        let cancel = UIAlertAction(title: "Cancel", style: .cancel)
        clientPicker.addAction(cancel)
        
        application.topViewController?.present(clientPicker, animated: true)
    }
}

// MARK: - MFMailComposeViewControllerDelegate

extension Mailer: MFMailComposeViewControllerDelegate {
    public func mailComposeController(
        _ controller: MFMailComposeViewController,
        didFinishWith result: MFMailComposeResult, error: Error?
    ) {
        controller.dismiss(animated: true)
    }
}
