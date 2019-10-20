$FolderList = Get-ChildItem -Directory -Force; foreach ($folder in $FolderList)
{
    set-location $folder.FullName
    $size = Get-ChildItem -Recurse -Force -ErrorAction SilentlyContinue | Measure-Object -Sum Length
    $info = $folder.FullName + "    FileCount: " + $size.Count.ToString() + "   Size: " + [math]::Round(($size.Sum /
1GB),4).ToString() + " GB"
    write-host $info
}; popd