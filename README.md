# Postmaster - Email for humans

Postmaster is a simple, easy to use SMTP/IMAP library with an API inspired by
[NodeMailer][nm].

[nm]: http://www.nodemailer.com/

# Usage

## Services

Postmaster maintains a list of common and well-known services, so you don't have
to worry about hosts and ports, and can just send email to addresses.

~~~lisp
(in-package :postmaster.services)

;; You can find services by name
(find-service-by-name "gmail")

;; ... Or by domain name
(find-service-by-domain "gmail.com")

;; Failing that, you can define your own
(defparameter *service*
  (make-instance '<service>
                 :name "GMail"
                 :domains (list "gmail.com" "googlemail.com")
                 :smtp-server (make-instance '<smtp-server>
                                             :host "smtp.gmail.com"
                                             :ssl :tls)))
~~~

Class defaults (SSL, ports) are safe and sane.

## Accounts

Once you have a service, you log in:

~~~lisp
(in-package :postmaster.services)

(defparameter *account*
  (make-instance '<account>
                 :service *service*
                 :username "me@gmail.com"
                 :password "A really long, safe dictionary password. Right?"))
~~~

## Sending Email

~~~lisp
(defparameter *email*
  (make-instance 'postmaster.email:<email>
                 :from "me@gmail.com"
                 :to "friend@initech.com"
                 :subject "Why you should rewrite all your startup's code in CL"
                 :body "Paul Graham. Speed. Macros. CLOS. Done"))

(postmaster.smtp:send *account* *email*)
~~~

# Extensions

## [Postmaster Mock][pmock]

This library provides a mock Email service that stores all messages it gets in
an internal store. Accounts can be registered to the service and the stored
emails inspected. This is useful for testing a Postmaster-based application.

[pmock]: https://github.com/eudoxia0/postmaster-mock

# License

Copyright (c) 2014 Fernando Borretti (eudoxiahp@gmail.com)

Licensed under the MIT License.
