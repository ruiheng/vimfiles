@rem @echo off
@setlocal
cd bundle
mklink /d %1 ..\available\%1
cd ..
