//
//  LoginManager.swift
//  Swift Off
//
//  Created by Ashkan Kashani on 2/17/16.
//  Copyright © 2016 Primer. All rights reserved.
//

import Foundation
import Firebase

class LoginManager: NSObject, PMRExperienceDelegate  {
    let fireBaseRef: Firebase

    override init() {
        self.fireBaseRef = Firebase(url: FIREBASE_BASE_URL)
    }

    // LoginManager can be used as singleton for the whole app
    class var sharedInstance: LoginManager {
        struct Singleton {
            static let instance = LoginManager()
        }
        return Singleton.instance
    }

    func logoutUser() {
        // Log user out of Primer and show the Primer welcome screens again for user to signup or login
        Primer.logOutUser()
        Primer.presentExperience()

        self.fireBaseRef.unauth();
    }

    func signUpWithInputsPrimer(inputs: [NSObject : AnyObject]!, completionBlock: PMRValidationBlock!, signupComplete: Bool) {
        let result = PMRValidationResult()

        if signupComplete {
            // Important to allow your users to use multiple devices
            Primer.signUpUserWithID(inputs["email"] as! String)
        } else {
            result.invalidateWithErrorMessage("There was an issue signing up.")
        }

        completionBlock(result)
    }

    func loginWithInputsPrimer(inputs: [NSObject : AnyObject]!, completionBlock: PMRValidationBlock!, loginComplete: Bool) {
        let result = PMRValidationResult()

        if loginComplete {
            // Important to allow your users to use multiple devices
            Primer.logInUserWithID(inputs["email"] as! String)
        } else {
            result.invalidateWithErrorMessage("There was an issue logging in.")
        }

        completionBlock(result)
    }

    func recoverWithInputsPrimer(inputs: [NSObject : AnyObject]!, completionBlock: PMRValidationBlock!, recoverComplete: Bool) {
        let result = PMRValidationResult()

        if !recoverComplete {
            result.invalidateWithErrorMessage("There was an issue with recovering your password.")
        }

        completionBlock(result)
    }


    // Our sign up screens with Primer will call this method on sign up.
    func signupWithInputs(inputs: [NSObject : AnyObject]!, completionBlock: PMRValidationBlock!) {
        let email = inputs["email"] as? String
        let password = inputs["password"] as? String

        // Sign up with Firebase
        self.fireBaseRef.createUser(email, password: password,
            withValueCompletionBlock: { error, result in
                if error != nil {
                    // There was an error creating the firebase account
                    self.signUpWithInputsPrimer(inputs, completionBlock: completionBlock, signupComplete: false)
                } else {
                    // We are now logged in
                    self.signUpWithInputsPrimer(inputs, completionBlock: completionBlock, signupComplete: true)
                }
        })
    }

    // Our Primer sign up screens will call this method when a user logs in with email and password.
    func loginWithInputs(inputs: [NSObject : AnyObject]!, completionBlock: PMRValidationBlock!) {
        let email = inputs["email"] as? String
        let password = inputs["password"] as? String
        
        self.fireBaseRef.authUser(email, password: password,
            withCompletionBlock: { error, authData in
                if error != nil {
                    // There was an error logging in to this account
                    self.loginWithInputsPrimer(inputs, completionBlock: completionBlock, loginComplete: false)
                } else {
                    // We are now logged in
                    self.loginWithInputsPrimer(inputs, completionBlock: completionBlock, loginComplete: true)
                }
        })
    }

    // Our Primer password recovery screen will call this method when a user requests a password reset
    func recoverWithInputs(inputs: [NSObject : AnyObject]!, completionBlock: PMRValidationBlock!) {
        let email = inputs["email"] as? String

        self.fireBaseRef.resetPasswordForUser(email, withCompletionBlock: { error in
            if error != nil {
                self.recoverWithInputsPrimer(inputs, completionBlock: completionBlock, recoverComplete: false)
            } else {
                self.recoverWithInputsPrimer(inputs, completionBlock: completionBlock, recoverComplete: true)
            }
        })
    }
}
