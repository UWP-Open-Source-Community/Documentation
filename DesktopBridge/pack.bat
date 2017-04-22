del {application-name.appx}

"{windows-kits-path}\makeappx.exe" pack -d PackageFiles -p {application-name.appx}

"{windows-kits-path}\signtool.exe" sign -f {cert-name}.pfx -fd SHA256 -p "123456" -v {application-name.appx}

pause
 