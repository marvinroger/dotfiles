# Usage: yubikey <load|unload>

function yubikey --description "Load/unload YubiKey into ssh-agent"
  # Workaround: SSH does not work with symbolic links
  # So we make a hard copy
  rsync --checksum --copy-links /usr/local/lib/libykcs11.dylib /usr/local/lib/libykcs11_NOTALINK.dylib

  set --local argc (count $argv)
  if test $argc -ne 1
    pretty_log error "Please give load or unload."
    return 1
  end

  switch $argv[1]
    case load
      ssh-add -s /usr/local/lib/libykcs11_NOTALINK.dylib
    case unload
      ssh-add -e /usr/local/lib/libykcs11_NOTALINK.dylib
    case "*"
      pretty_log error "Please give load or unload."
      return 1
  end
end
