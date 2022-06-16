#!/bin/bash
echo “Please provide a path to dir.”
read path
if  [[ -d $path ]]
then
for FILE in $path/*
do
if [[ -f $FILE ]]
then
        cp $FILE /home/$USER/
else
    echo “There are no files in the given path.”
fi
done
else
    echo “Path to dir is required”
fi