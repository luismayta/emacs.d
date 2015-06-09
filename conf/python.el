;; python configuration
(bundle 'python-mode nil)

(require 'python-mode)

(el-get-install 'jedi)
(require 'jedi)

;; make jedi-mode
(autoload 'jedi:setup "jedi" nil t)
(setq jedi:setup-keys t)

;;python mode
(add-hook 'python-mode-hook
  (lambda ()
    (jedi:setup)
    ;(elpy-enable)
    ;(elpy-use-ipython)
    (setq python-python-command "ipython")))
