# magisk-modules-disabler
  
This module allows you to disable the Magisk module if the data partition cannot be decrypted and cannot be restored to normal by entering Safe Mode.

---

## How To Use

Create a file named `disable_all_modules` in `/data/unencrypted` or `/cache` to disable all modules.

Create a file named `disable.list` in `/data/unencrypted` or `/cache` and write module ids (one module per line) in it to disable specific modules.

Tips: The module id is the name of the module's directory

Example: The module id of [Log-Catcher](https://github.com/Howard20181/Log-Catcher) is `hwr_logcat`
