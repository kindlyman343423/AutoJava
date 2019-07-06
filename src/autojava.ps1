function autojava($file)
{
    $len = $file.ToString().Length;
    $name = $file.ToString().Substring(0,$len-5)

    # while(inotifywait -q -e modify $file >/dev/null)
    # {
        # Write-Output $name
    #     break
    # }

    javac $file
    java $name
    # if(javac $file)
    # {
    #     javac $file
    #     java $name
    # }
}

if(javac -version)
{
    javac -version

    if($null -eq $($args[0]))
    {
        Write-Output "Wrong arguments passed"
        Write-Output "Try: pwsh autojava.ps1 filename.java"
    }
    else
    {
        $str = $($args[0])

        $len = $str.ToString().Length;

        $extension = $str.ToString().Substring($len-4,4)
        
        if($extension -eq "java")
        {
            autojava "$($args[0])"
        }
        else
        {
            Write-Output "wrong extension of the file"
            Write-Output "Try: pwsh autojava.ps1 filename.java"
        }
    }
}

# https://github.com/thekid/inotify-win