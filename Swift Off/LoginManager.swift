//
//  LoginManager.swift
//  Swift Off
//
//  Created by Ashkan Kashani on 2/17/16.
//  Copyright © 2016 Primer. All rights reserved.
//

import Foundation
import Firebase

class LoginManager: NSObject, PMROnboardDelegate  {
    let fireBaseRef: Firebase

    override init() {
        self.fireBaseRef = Firebase(url: "https://<YOUR-FIREBASE-APP>.firebaseio.com")
    }

    func logoutUser() {
        // Log user out of Primer and show the Primer welcome screens again for user to signup or login
        Primer.sharedInstance().logoutUser()
        Primer.sharedInstance().showLogoutScreen()

        // self.loggedInUser = nil;     do we need this? change to swift if so
        self.fireBaseRef.unauth();
    }

    func signUpWithInputsFireBase(inputs: [NSObject : AnyObject]!) -> Bool {
        var complete: Bool = false
        self.fireBaseRef.createUser("bobtony@example.com", password: "correcthorsebatterystaple",
            withValueCompletionBlock: { error, result in
            if error != nil {
                // There was an error creating the firebase account
                complete = false
            } else {
                let uid = result["uid"] as? String
                // println("Successfully created user account with uid: \(uid)")
                complete = true
            }
        })
        return complete
    }

    func loginWithInputsFireBase(inputs: [NSObject : AnyObject]!) -> Bool {
        var complete: Bool = false
        self.fireBaseRef.authUser("bobtony@example.com", password: "correcthorsebatterystaple",
            withCompletionBlock: { error, authData in
            if error != nil {
                // There was an error logging in to this account
                complete = false
            } else {
                // We are now logged in
                complete = true
            }
        })
        return complete
    }

    func signUpWithInputsPrimer(inputs: [NSObject : AnyObject]!, completionBlock: PMRValidityResultBlock!,
        signupComplete: Bool) -> PMRValidityResult {
        let result = PMRValidityResult()

        if signupComplete {
            result.isValid = true
            // Important to allow your users to use multiple devices
            result.userID = inputs["username"] as! String
        } else {
            result.isValid = false
            result.errorMessage = "There was an issue signing up."
        }

        // Always call the completion block
        completionBlock(result)
        return result
    }

    func loginWithInputsPrimer(inputs: [NSObject : AnyObject]!, completionBlock: PMRValidityResultBlock!,
        loginComplete: Bool) -> PMRValidityResult {
        let result = PMRValidityResult()

        if loginComplete {
            result.isValid = true
            // Important to allow your users to use multiple devices
            result.userID = inputs["username"] as! String
        } else {
            result.isValid = false
            result.errorMessage = "There was an issue logging in."
        }

        // Always call the completion block
        completionBlock(result)
        return result
    }

    func signupWithInputs(inputs: [NSObject : AnyObject]!, completionBlock: PMRValidityResultBlock!) {
        let signupComplete: Bool = self.signUpWithInputsFireBase(inputs)
        let result: PMRValidityResult = self.signUpWithInputsPrimer(inputs, completionBlock: completionBlock, signupComplete: signupComplete)
        if !result.isValid {
            // Sign Up failed
        } else {
            // Sign Up succeeded
        }
    }

    func loginWithInput(inputs: [NSObject : AnyObject]!, completionBlock: PMRValidityResultBlock!) {
        let loginComplete: Bool = self.loginWithInputsFireBase(inputs)
        let result: PMRValidityResult = self.loginWithInputsPrimer(inputs, completionBlock: completionBlock, loginComplete: loginComplete)
        if !result.isValid {
            // Log In failed
        } else {
            // Log In succeeded
        }
    }
}