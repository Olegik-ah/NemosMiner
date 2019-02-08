# NemosMiner

Updated 8 Febuary 2019

[![Version tag](https://img.shields.io/github/release/nemosminer/NemosMiner.svg)](https://github.com/nemosminer/NemosMiner/releases/latest) [![Version date tag](https://img.shields.io/github/release-date/nemosminer/NemosMiner.svg)](https://github.com/nemosminer/Nemosminer/releases/latest) [![Issues tag](https://img.shields.io/github/issues-raw/nemosminer/NemosMiner.svg)](https://github.com/nemosminer/NemosMiner/issues)
[![GitHub license](https://img.shields.io/github/license/nemosminer/NemosMiner.svg)](https://github.com/nemosminer/NemosMiner/blob/master/LICENSE)
![Releases](https://img.shields.io/github/downloads/nemosminer/NemosMiner/total.svg)

Copyright (c) 2019 Nemo and MrPlus

This is free software, and you are welcome to redistribute it
under certain conditions.
https://github.com/nemosminer/NemosMiner/blob/master/LICENSE

by Nemo/Minerx117

with Help From MrPlusGH and grantemsley 
 
[![Discord tag](https://img.shields.io/discord/522832112311599124.svg?label=Discord&style=plastic)](https://discord.gg/2BCqPxe) [Click to Join Discord](https://discord.gg/2BCqPxe)

*****
**Have questions? Need help?** We're on Discord: https://discord.gg/2BCqPxe

NemosMiner Monitors mining pools in real-time in order to find the most profitable Algo

	 GUI and easy configuration
	 Auto Benchmarks Each algo to get optimal speeds 
	 Fully automated 
	 Auto Downloads Miners
	 Auto Updates
	 Monitoring

*****

Easy configuration, easy start:

      Run NemosMiner.bat
      1. Config tab
      2. Set your Wallet address and Username
      3. Select your pool 
      4. Save Config
      5. Start
      
      note: 2. you only need to change Username if you are using Miningpoolhub
      
     Algo selection / removal
  
      +algo for algo selection
      -algo for algo removal

      If "+" Used, all selected algo have to be listed
      If "Minus" Used, all algo selected but exluded ones.

      Do not combine + and - for the same algo

     Examples:
     Algo list = -x16r
     Will mine anything but x16r

     Algo list = -x16r,-bcd
     Will mine anything but x16r and bcd

     Algo list = +x16r
     Will mine only x16r

     Algo list = +x16r,+bcd
     Will mine only x16r and BCD

     Algo list = +x16r
     Will mine only x16r

     Algo list blank
     Will mine anything
  
  Pools variants

      24hr - uses last 24hour Actual API too request profit
         -Low switching rate
      plus - uses advanced calculations to reduce switching
         -Medium switching rate
      normal - uses current estimate API too request profit
         -High switching rate
  
  Developer/Contributors Donation: 
  list and wallets is publicly available at: https://nemosminer.com/data/devlist.json
     
      There is a 8 minute per day donation (0.5%), that can be changed in the config (Minimum is 3)0.2%
      We want to stay completely transparent on the way donations are managed in the product. Donations occurs once every 24 hours for the selected amount of time (default 8 minutes). The first donation sequence occurs 1 hour after miners are started. If Interval is set higher than the donation time, the interval will prime. Example for default parameters. Miners started at 10, First donation cycle runs at 10:52 untill 11, Next donation cycle occurs 24 hours after.All donation time and addresses are recording in the logs folder.

NemosMiner Monitoring Server : https://nemosminer.com

     Keep tabs on all your mining rigs from one place
     You can now optionally monitor all your workers remotely, both in the GUI and via https://nemosminer.com  
     Monitoring setup instructions https://nemosminer.com/setup.php 

   
   GUI
   
      Since version 3.0 NemosMiner has a GUI making it easy to configure and run.
	  Relies on config files. No need to edit bat files. Simply run NemosMiner 
	  Set the config on the config tab, save, close, run

   Pause mining
   
      Ability to pause miners while keeping other jobs running (pause button)
      This will stop mining activity
      BrainPlus will still run in the background avoiding the learning phase on resume
      EarningTracker will still run in the background avoiding the learning phase on resume

   prerun
   
      Ability to run a batch prior switching to a specific algo.
      For example, can be used to set per algo OC via nvidiaInspector
      Simply create a file named <AlgoName>.bat in prerun folder
      If <AlgoName>.bat does not exist, will try to launch prerun/default.bat
      Use overclock with caution

   Per pools config (Advanced)
   
        - **This is for advanced users. Do not use if you do not know what you are doing.**
        - You can now set specific options per pool. For example, you can mine NiceHash on the internal wallet and other pools on a valid wallet. This configuration is provided as an example in Config\PoolsConfig-NHInternal.json
          - Available options
            - Wallet = your wallet address
            - UserName = your MPH user name
            - WorkerName = your worker name
            - PricePenaltyFactor = See explanation below
	    - Algorithm = List of included or excluded Aglo on pool (see example files)
          - Usage
            - The file Config\PoolsConfig.json contains per pool configuration details. If a pool is listed in this file,
	    the specific settings will be taken into account. If not, the setting for the entry name default will be used.
	    **Do not delete the default entry.**
            - Edit Config\PoolsConfig.json
            - Add an entry for the pool you want to customize
              - The name must be the NemosMiner name for the pool. ie. for ahashpool, if you use Plus. The name is ahashpoolplus.
              - (**careful with json formating ;)**)
              - Best way is to duplicate the default entry
        - Note that the GUI only updates the default entry. Any other changes need to be done manualy

   PricePenaltyFactor

        - When using advanced per pool configuration, it is possible to add a penalty factor for a specific pool. This simply adds as a multiplicator on estimations presented by the pool.
        - Example scenario
          - NiceHash has a 4% fee - Set PricePenaltyFactor to 0.96 (1-0.04)
          - You feel like a pool is exaggerating his estimations by 10% - Set PricePenaltyFactor to 0.9

  zergpoolplus/nlpoolplus/ahashpoolplus/zpoolplus/blazepoolplus/phiphipoolplus/blockmastersplus/hashrefineryplus/starpoolplus
   
      Uses calculations based on 24hractual and currentestimate ahashpool prices to get more realistic estimate.
      Includes some trust index based on past 1hr currentestimate variation from 24hr.
      AND is NOT sensible to spikes.
      This shows less switching than following Current Estimate and more switching that following the 24hr Actual.
      Better profitability.

   Earnings Tracking
   
      Displays BTC/H and BTC/D as well a estimation of when the pool payment threshold will be reached.
      Supported pools:
            ahashpool
            zpool
            nicehash
            miningpoolhub (partial)
      If mining more that one pools, shows stats for any supported pool
      Press key e in the console window to show/hide earnings

   Support running multiple instances
   
      **Experimental**
      More than one instance of NemosMiner can run on the same rig
      Each instance must be placed in it's own directory
      Miner has to be started prior the launch of the next instance

   Optional miners (Advanced)
   
      Some miners are not enabled by default in NemosMiner for a variety of reasons:
          - ccminerenemy / zealot / trex / cryptodredge
              These are closed source and therefore not enabled in NemosMiner by default.
              Use at your own risk.
          - Excavator
              Note as Excavator is owned by "Nicehash" and has a EULA it is NOT enabled in NemosMiner by default

      For advanced users, check the Optional Miners checkbox on the Config tab to enable these miners.

   Algo switching log
   
      Simple algo switching log in csv switching.log file found in Logs folder.
      You can easily track switching rate.

   Console Display Options
   
      Use -UIStyle Light or -UIStyle Full in config.json
            Full = Usual display (Default)
            Light = Show only currently mining info
      UIStyle automaticaly swtiches to Full during benchmarking.

   In session console display toggle
   
      Press key s in the window to switch between light and full display
      Press key e in the window to show/hide earnings 
      Will toggle display at next refresh

   New version notification
   
      NemosMiner will notify new version availability
*****
 

If you have Windows 7, 8, or 8.1, please update PowerShell:
https://www.microsoft.com/en-us/download/details.aspx?id=54616

CCMiner may need 'MSVCR120.dll' if you don't already have it:
https://www.microsoft.com/en-gb/download/details.aspx?id=40784

CCMiner may need 'VCRUNTIME140.DLL' if you don't already have it:
https://www.microsoft.com/en-us/download/details.aspx?id=48145

running multiple cards its recommended to increase Virtual Memory 64gb is optimal

recommended/optimal Nvidia driver 417.71 / http://us.download.nvidia.com/Windows/417.71/417.71-desktop-win10-64bit-international-whql.exe

Made for & Tested with 6x1070 6x1070ti 6x1080 6x1080ti 6x1660ti 6x2060 6x2070 6x2080 6x2080ti(users have reported up to 12cards working have not tested myself)
Some miners do not support more that 9 cards

*****

Licensed under the GNU General Public License v3.0
Permissions of this strong copyleft license are conditioned on making available complete source code of licensed works and modifications, which include larger works using a licensed work, under the same license. Copyright and license notices must be preserved. Contributors provide an express grant of patent rights. https://github.com/nemosminer/NemosMiner/blob/master/LICENSE
