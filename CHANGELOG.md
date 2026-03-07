# Changelog

## v3.0
- Hide permissive state from non-root apps (chmod sysfs, resetprop)
- Delete legacy ro.build.selinux property on older devices
- Add install-time security warning (customize.sh)
- Add cleanup on module removal (uninstall.sh)
- Add Magisk Manager auto-update support (updateJson)
- Add pre-commit hook for ShellCheck and version consistency checks

## v2.0
- Delay service.sh switch to boot completion
- Add dual fallback (setenforce / sysfs write)

## v1.1
- Remove property overrides to avoid SafetyNet detection

## v1.0
- Initial release
