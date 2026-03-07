# Changelog

## v3.1
- Add pre-commit hook for ShellCheck and version consistency checks
- Add `make setup` target to install pre-commit hook
- Add pre-commit hook section to CHECKLIST.md
- Made sh script POSIX compliant

## v3.0
- Hide permissive state from non-root apps (chmod sysfs, resetprop)
- Delete legacy ro.build.selinux property on older devices
- Add install-time security warning (customize.sh)
- Add cleanup on module removal (uninstall.sh)
- Add Magisk Manager auto-update support (updateJson)

## v2.0
- Delay service.sh switch to boot completion
- Add dual fallback (setenforce / sysfs write)

## v1.1
- Remove property overrides to avoid SafetyNet detection

## v1.0
- Initial release
