if (!(IsLoaded(".\Include.ps1"))) {. .\Include.ps1; RegisterLoaded(".\Include.ps1")}

$Path = ".\Bin\NVIDIA-CryptoDredge0161\CryptoDredge.exe"
$Uri = "https://github.com/technobyl/CryptoDredge/releases/download/v0.16.1/CryptoDredge_0.16.1_cuda_10.0_windows.zip"

$Commands = [PSCustomObject]@{
    "allium"            = " --intensity 8 -a allium" #Allium (fastest)
    "lyra2v3"           = " --intensity 8 -a lyra2v3" #Lyra2v3 (fastest)
    "lyra2zz "          = " --intensity 8 -a lyra2zz" #Lyra2zz (Testing)
    "neoscrypt"         = " --intensity 6 -a neoscrypt" #NeoScrypt (fastest)
    "phi"               = " --intensity 8 -a phi" #Phi (fastest)
    "phi2"              = " --intensity 8 -a phi2" #Phi2 (fastest)
    "lyra2vc0ban"       = " --intensity 8 -a lyra2vc0ban" #Lyra2vc0banHash (fastest)
    #"cryptonightheavy"  = " --intensity 8 -a cryptonightheavy" # CryptoNightHeavy(fastest)
    #"x22i"              = " --intensity 8 -a x22i" # X22i (trex faster)
    #"tribus"            = " --intensity 8 -a tribus" #Tribus (not profitable)
    #"cnv8"              = " --intensity 8 -a cnv8" #CryptoNightv8 (fastest)
    #"cryptonightmonero" = " --intensity 8 -a cnv8" # Cryptonightmonero (fastest)
    #"c11"               = " --intensity 8 -a c11" #C11 (trex faster)
    "skunk"             = " --intensity 8 -a skunk" #Skunk (fastest)
    "mtp"               = " --intensity 8 -a mtp" #Mtp (not Asic :)
    #"bcd"               = " --intensity 8 -a bcd" #Bcd (trex faster)
    #"x16rt"             = " --intensity 8 -a x16rt" #X16rt (testing)
    "x21s"              = " --intensity 8 -a x21s" #X21s (fastest)
    #"x16s"              = " --intensity 8 -a x16s" #X16s (trex faster)
    #"x17"               = " --intensity 8 -a x17" #X17 (trex faster)
    #"bitcore"           = " --intensity 8 -a bitcore" #Bitcore (trex faster)
    "hmq1725"           = " --intensity 8 -a hmq1725" #Hmq1725 (fastest thanks for the fix)
    "dedal"             = " --intensity 8 -a dedal" #Dedal (trex faster second place)
    "pipe"              = " --intensity 8 -a pipe" #Pipe (fastest)
    #"x16r"              = " --intensity 8 -a x16r" #x16r (trex fastest)
}

$Name = (Get-Item $script:MyInvocation.MyCommand.Path).BaseName

$Commands | Get-Member -MemberType NoteProperty | Select-Object -ExpandProperty Name | ForEach-Object {
    [PSCustomObject]@{
        Type      = "NVIDIA"
        Path      = $Path
        Arguments = "--no-nvml --api-type ccminer-tcp --no-color --cpu-priority 5 --no-crashreport --no-watchdog -r -1 -R 1 -b 127.0.0.1:$($Variables.NVIDIAMinerAPITCPPort) -d $($Config.SelGPUCC) -o stratum+tcp://$($Pools.(Get-Algorithm($_)).Host):$($Pools.(Get-Algorithm($_)).Port) -u $($Pools.(Get-Algorithm($_)).User) -p $($Pools.(Get-Algorithm($_)).Pass)$($Commands.$_)"
        HashRates = [PSCustomObject]@{(Get-Algorithm($_)) = $Stats."$($Name)_$(Get-Algorithm($_))_HashRate".Day * .99} # substract 1% devfee
        API       = "ccminer"
        Port      = $Variables.NVIDIAMinerAPITCPPort
        Wrap      = $false
        URI       = $Uri
        User      = $Pools.(Get-Algorithm($_)).User
    }
}
