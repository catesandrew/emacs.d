;;; config.el --- cats-org

;;; Commentary:

;; Personal functions

;;; Code:

(defvar cats//org-dir "~/org/")

(defvar cats//org-jira-dir (concat cats//org-dir "jira/"))

(defvar cats//org-jira-projects '("UIE" "WEL"))

;; (cdr (assoc "UIE" cats//org-jira-projects-issue-types))
;; (car (rassoc "Bug" (cdr (assoc "UIE" cats//org-jira-projects-issue-types))))
;; (cdr (assoc "1" (cdr (assoc "UIE" cats//org-jira-projects-issue-types))))

;; jira req https://jira.int.payoff.com/rest/api/2/issuetype | jq '.[] | {id, name}' | jq -r '"(\"\(.id)\" . \"\(.name)\")"'
(defconst cats//org-jira-projects-issue-types
  "List of Project to issuetypes"
  '(("UIE"
      ("1" . "Bug")
      ("4" . "Improvement")
      ("8" . "Epic")
      ("3" . "Task")
      ("5" . "Sub-task")
      ("10800" . "Story")
      ("7" . "User Story")
      ("10416" . "Research")
      ("10412" . "Data Pull")
      ("10413" . "Dashboard")
      ("10415" . "Automation")
      ("10900" . "Reporting")
      ("11401" . "Change Request")
      ("10408" . "SoftwareDeployment")
      ("10409" . "InfrastructureDeployment")
      ("10410" . "ProductionConfigChange")
      ("10411" . "PermissionsChange")
      ("11400" . "QA Sub-task")
      ("11500" . "Work Logging")
      ("10418" . "Analysis")
      ("10414" . "Modeling")
      ("10417" . "Training")
      ("10106" . "Access")
      ("10102" . "IT Help")
      ("11000" . "UIE - Design")
      ("10103" . "Purchase")
      ("10104" . "Change")
      ("10105" . "Fault")
      ("10500" . "Off-Boarding")
      ("10700" . "LegacyIssue")
      ("10701" . "NewPlatformIssue")
      ("11200" . "MemberDataExport")
      ("11201" . "MemberDataDelete")
      ("11202" . "HMA")
      ("11203" . "Product Task")
      ("11204" . "Training Task")
      ("11300" . "QA task")
      ("11100" . "New Feature")
      ("10600" . "Service Request"))
     ("WEL"
       ("71" . "Business Question")
       ("91" . "Reject")
       ("171" . "Failed Peer Review")
       ("221" . "Done"))
     ))


(defvar cats//org-roam-dir (concat cats//org-dir "refs/notes/"))

(defvar cats//org-roam-dailies-dir (concat cats//org-roam-dir "daily/"))

(defvar cats//bibtex-library-dir "~/Zotero/")

(defvar cats//org-mobile-dir "mobile/")

(defvar cats//org-journal-dir "journal/")

(defvar cats//org-mobile-inbox-file "flagged.org")

(defvar cats//org-gtd-file "gtd.org")

(defvar cats/org-habits-file "habits.org")

(defvar cats//org-calendar-file "calendar.org")

(defvar cats//org-capture-file "capture.org")

(defvar cats//org-logbook-file "logbook.org")

(defvar cats//org-inbox-file "inbox.org")

(defvar cats//org-refile-file "refile.org")

(defvar cats//org-notes-file "notes.org")

(defvar cats//org-journal-file "journal.org")

(defvar cats//keep-clock-running nil)

;; do not keep org-agenda-files open after generating agenda
;; https://emacs.stackexchange.com/questions/5741
(defvar cats-opened-org-agenda-files nil)

(defvar cats//org-agenda-file-regexp-list '()
  "List of all `org-agenda' file regexps.")

(defvar cats//org-agenda-list '()
  "List of all `org-agenda' files.")

(defvar cats//org-properties-string "
:PROPERTIES:
:CREATED: %U
:END:")

(defvar cats-jira-default-jql
  "assignee = currentUser() and resolution = unresolved ORDER BY priority DESC, created ASC")

;; Thanks to
;; [[http://endlessparentheses.com/embedding-youtube-videos-with-org-mode-links.html][endlessparentheses]]:
;; Youtube makes it pretty simple to embed videos, they give you the entire
;; iframe HTML code to use, but this wouldn't really be Emacs if we couldn't
;; make things just a little bit easier.
(defvar cats//org-yt-iframe-format
  ;; You may want to change your width and height.
  (concat "<iframe width=\"440\""
    " height=\"335\""
    " src=\"https://www.youtube.com/embed/%s\""
    " frameborder=\"0\""
    " allowfullscreen>%s</iframe>"))

(defvar pretty-symbols/org
  '((">=" . ?≥)
    ("<=" . ?≤)
    ("\\geq" . ?≥)
    ("\\leq" . ?≤)
    ("\\neg" . ?¬)
    ("\\rightarrow" . ?→)
    ("\\leftarrow" . ?←)
    ("\\infty" . ?∞)
    ("-->" . ?→)
    ("<--" . ?←)
    ("\\exists" . ?∃)
    ("\\nexists" . ?∄)
    ("\\forall" . ?∀)
    ("\\or" . ?∨)
    ("\\and" . ?∧)
    (":)" . ?☺)
    ("):" . ?☹)
    (":D" . ?☺)
    ("\\checkmark" . ?✓)
    ("\\check" . ?✓)
    ("1/4" . ?¼)
    ("1/2" . ?½)
    ("3/4" . ?¾)
    ("1/7" . ?⅐)
    ("1/5" . ?⅕)
    ("2/5" . ?⅖)
    ("3/5" . ?⅗)
    ("4/5" . ?⅘)
    ("1/6" . ?⅙)
    ("1/6" . ?⅚)
    ("1/6" . ?⅛)
    ("1/6" . ?⅜)
    ("1/6" . ?⅝)
    ("1/6" . ?⅞)
    ("ae" . ?æ)
    ("^_^" . ?☻))
  "Symbols for org mode.")

(defvar org-enable-jira-support nil
  "If non-nil Jira related packages are configured.")

(defvar org-enable-ox-support nil)
(defvar org-enable-ox-latex-support nil)
(defvar org-enable-ox-bibtex-support nil)
(defvar org-enable-ox-beamer-support nil)
(defvar org-enable-ox-md-support nil)
(defvar org-enable-ox-publish-support nil)
(defvar org-enable-jira-support nil)
(defvar org-enable-ox-html-support nil)
(defvar org-enable-ox-ascii-support nil)
(defvar org-enable-ox-confluence-support nil)

;; (defvar bh/organization-task-id "20140625-424242-424242")

;; (defvar bh/insert-inactive-timestamp t)



;; ox-html
(defvar cats//link-svg-html
  "<svg aria-hidden=\"true\" class=\"octicon octicon-link\" height=\"16\" version=\"1.1\" viewBox=\"0 0 16 16\" width=\"16\"><path fill-rule=\"evenodd\" d=\"M4 9h1v1H4c-1.5 0-3-1.69-3-3.5S2.55 3 4 3h4c1.45 0 3 1.69 3 3.5 0 1.41-.91 2.72-2 3.25V8.59c.58-.45 1-1.27 1-2.09C10 5.22 8.98 4 8 4H4c-.98 0-2 1.22-2 2.5S3 9 4 9zm9-3h-1v1h1c1 0 2 1.22 2 2.5S13.98 12 13 12H9c-.98 0-2-1.22-2-2.5 0-.83.42-1.64 1-2.09V6.25c-1.09.53-2 1.84-2 3.25C6 11.31 7.55 13 9 13h4c1.45 0 3-1.69 3-3.5S14.5 6 13 6z\"></path></svg>")

(defvar cats//current-html-headline)


;;; config.el ends here
