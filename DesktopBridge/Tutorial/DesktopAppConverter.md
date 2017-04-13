# Desktop App Converter (DAC)

The DAC is a tool that automatically converts and signs your app for you. The DAC is convenient and automatic, and it's useful if your app makes lots of system modifications or if there's any uncertainty about what your installer does.

# Prerequisities

Make sure that your system meets the following requirements:

* Windows 10 Anniversary Update (10.0.14393.0 and later) Pro or Enterprise edition.
* 64 bit (x64) processor
* Hardware-assisted virtualization
* Second Level Address Translation (SLAT)
* Windows Software Development Kit (SDK) for Windows 10.

# Start the Desktop App Converter

1. Download and install the [Desktop App Converter](https://aka.ms/converter)
2. Run the Desktop App Converter as an administrator. A console window appears. You'll use that console windows to run commands.

# Convert an app

To convert your app, run the DesktopAppConverter.exe command in the console window that opened when you started the Desktop App Converter. 
 
You'll specify the package name, publisher and version number of the app by using parameters.

## A quick look at command parameters

DesktopAppConverter.exe
-Installer <String>
-Destination <String>
-PackageName <String>
-Publisher <String>
-Version <Version>

## Convert an app that has an installer (.msi) file

Point to the installer file by using the "Installer" parameter.

### Example:

DesktopAppConverter.exe -Installer C:\Installer\MyAppSetup.msi -Destination C:\Output\MyApp -PackageName "MyApp" -Publisher "CN=MyPublisher" -Version 0.0.0.1

## Convert an app that has a setup executable file

Point to the setup executable by using the Installer parameter.

### Example: 

DesktopAppConverter.exe -Installer C:\Installer\MyAppSetup.exe -InstallerArguments "/S" -Destination C:\Output\MyApp -PackageName "MyApp" -Publisher "CN=MyPublisher" -Version 0.0.0.1

The InstallerArguments parameter is an optional parameter. However, because the Desktop App Converter needs your installer to run in unattended mode, you might have to use it if your app needs silent flags to run silently. The /S flag is a very common silent flag, but the flag that you use might be different depending on which installer technology you used to create the setup file.

## Convert an app that doesn't have an installer

In this example, use the Installer parameter to point to the root folder of your app files.

Use the AppExecutable parameter to point to your apps executable file.

### Example:

DesktopAppConverter.exe -Installer C:\Installer\MyApp\ -AppExecutable MyApp.exe -Destination C:\Output\MyApp -PackageName "MyApp" -Publisher "CN=MyPublisher" -Version 0.0.0.1

## Convert an app, sing the app, and prepare it for store submission

This example is similar to first one except it shows how you can sign your app and then validate your app against Desktop Bridge and Windows Store requirements.

You can sign your app by using the optional Sign parameter and validate it by using the verify parameter.

### Example:

DesktopAppConverter.exe -Installer C:\Installer\MyAppSetup.exe -InstallerArguments "/S" -Destination C:\Output\MyApp -PackageName "MyApp" -Publisher "CN=MyPublisher" -Version 0.0.0.1 -MakeAppx -Sign -Verbose -Verify

