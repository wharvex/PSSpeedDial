# PSSpeedDial

## An Extensible Aliasing Framework for PowerShell

### Description

Do you have an ever-growing/changing set of long PowerShell commands that you use regularly?

Don't waste your time coming up with new aliases for them over and over that clutter up your `$profile` and pollute your namespace.

Instead, try **PSSpeedDial**, an extensible aliasing framework for PowerShell.

### General Instructions

**Step 1**

List your common commands in some specially-named text files on separate lines.

**Step 2**

Dot-source the `SpeedDial.ps1` script in your `$profile` and alias its functions.

**Step 3**

Call one of the functions with the line number you want as the argument, or with no arguments to see your available options.

### Quick Start

Execute the following commands in PowerShell:

```
git clone https://github.com/wharvex/PSSpeedDial.git
Copy-Item -Path .\PSSpeedDial\SpeedDialFiles_example\ -Destination "$env:USERPROFILE\SpeedDialFiles" -Recurse
. .\PSSpeedDial\SpeedDial.ps1
Invoke-Cd-On-X
```

And you should see the following output:

```
1 : C:\Users\[you]\OneDrive\Notes
2 : C:\Users\[you]\OneDrive\Documents\PowerShell\Scripts
3 : C:\Users\[you]\OneDrive\Projects
```

Congratulations! You just called one of the SpeedDial functions without arguments and it displayed your available options as output.

### Examples

You can run

```
Invoke-Cd-On-X 1
```

to invoke `cd` on the path after the colon on line 1 of the "available options" output. Or you can run

```
Invoke-Cd-On-X 2
```

to invoke `cd` on the path after the colon on line 2, etc...

Now simply edit the files in `"$env:USERPROFILE\SpeedDialFiles"` so they contain the common things you wish to access on your own machine, and you're up and running!

### Available Functions

Once you dot-source `SpeedDial.ps1`, the following functions will be available to you:

```
Invoke-Cd-On-X
Invoke-Start-On-X
Invoke-Vim-On-X
Invoke-Icm-On-X
```

