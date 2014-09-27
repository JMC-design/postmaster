(in-package :cl-user)
(defpackage postmaster.services
  (:use :cl :trivial-types)
  (:import-from :postmaster.smtp
                :<smtp-server>)
  (:import-from :postmaster.imap
                :<imap-server>)
  (:export :<service>
           :name
           :domains
           :smtp-server
           :imap-server))
(in-package :postmaster.services)

(defclass <service> ()
  ((name :reader name :initarg :name :type string)
   (domains :reader domains :initarg :domains :type (list-of string))
   (smtp-server :reader smtp-server :initarg :smtp-server :type <smtp-server>)
   (imap-server :reader smtp-server :initarg :imap-server :type <imap-server>)))