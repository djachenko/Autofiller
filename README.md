# Autofiller

Autofiller is a lightweight library for enabling Password Autofill in sign in/sign up forms without putting fields in the same container explicitly.

**Warning:** Unfortunately, as there still is no way to make Password Autofill work without placing views into same superview, Autofiller just makes all the dirty work in runtime and hides it under the hood. Changing view hierarchy may cause different UI issues. If you encounter one, please create a ticket, and I will look into it.

[![Build Status](https://travis-ci.com/djachenko/autofiller.svg?branch=master)](https://travis-ci.com/djachenko/autofiller)

## Installation
Autofiller is available via CocoaPods, so you may just add ``pod 'Autofiller'`` to your Podfile and go with it.

## Usage

Just pass your field into corresponding methods:

```
@IBOutlet private weak var loginField: UITextField!
@IBOutlet private weak var passwordField: UITextField!

Autofiller.connectFields(login: loginField, password: passwordField)
```

```
@IBOutlet private weak var loginField: UITextField!
@IBOutlet private weak var newPasswordField: UITextField!
@IBOutlet private weak var confirmPasswordField: UITextField!

// Autofiller.connectFields(login: loginField, newPassword: newPasswordField) -- confirmPassword may be omitted if not needeed
Autofiller.connectFields(login: loginField, newPassword: newPasswordField, confirmPassword: confirmPasswordField)
```
Connecting fields should happen after constraints have been initialized (`viewDidLoad()` is fine, `init()` is not).

## Requirements
* iOS 11.0 for just remembering passwords.
* iOS 12.0 for suggesting complex ones.
