#!/bin/sh
ServiceOperations()
{
    ListAllServices()
    {
        echo "hello"
        service --status-all
    }
    ServiceStatus()
    {
        read SERVICE;
        service $SERVICE status
    }
    GroupedServices()
    {
    
        echo "1.running 2.active"
        read servicechoice
        case $servicechoice in
            1) systemctl --type=service --state=running
            ;;
            2) systemctl --type=service --state=active
            ;;
        esac
    }   
 
    while :
    do
        echo "choose 1.list all services or 2.status of particular services  3.services grouped according to status  4.exit"
        read choice1
        case $choice1 in
            1) ListAllServices
            ;;
            2) ServiceStatus
            ;;
            3) GroupedServices
            ;;
            4) break
        esac
    done
}
FileOperations()
{ 
    CreateNewFile()
    {
        echo "enter the file name"
        read filename
        if test -f "$filename"; then
            echo "$filename already exists"
        else
            echo "enter the text to be entered into the file."
            read data;
            echo $data > $filename
        fi
    }
    RemoveContents()
    {
        echo "enter the file name"
        read filename
        if test -f "$filename"; then
            echo -n "" > $filename
            echo "Contents of a file can be removed"
        else
            echo "File does not exist"
        fi
    }
    CopyContents()
    {
        echo "copy the contents of one file to another"
        echo "enter the file name from which the contents should be copied :"
        read oldfile
        if test -f "$oldfile"; then
            echo "enter the file name where contents shoudl be copied: "
            read newfile
            
                cp $oldfile $newfile
                echo "contents from $oldfile have been copied to $newfile"
            
        else
            echo "$oldfile doesnot exist"
        fi
    }
    AppendContents()
    {
        echo "enter file name"
        read filenameappend
        if test -f "$filenameappend"; then
            echo "enter txt to be appedned"
            read dataappend
            echo $dataappend  >> $filenameappend
        else
            echo "$filenameappend does not exist"
        fi
    }
 
    while :
    do
        echo "choose 1. To create a new file and add data to it  2. To remove contents of a file 3.copy the contents from one file to another file 4.append contents to file 5.exit"
        read choice2
        case $choice2 in
            1) CreateNewFile
            ;;
            2) RemoveContents
            ;;
            3) CopyContents
            ;;
            4) AppendContents
            ;;
            5) break
        esac
    done
}
while :
do
    echo "choose 1.Service operations 2.File operations 3.exit"
    read choice
    case $choice in
        1) ServiceOperations
        ;;
        2) FileOperations
        ;;
        3) break
    esac
done