$storageAccountName = "sqlva7uxpyqt56vpgy"
$storageAccountKey = “vMqqQLqRuK9sVi1vE1scx8m6BrrFc7vTzJcCvRKsXGx9kYqMI7K2E/JTof3ZzDvyU1WNFTP67UCC3dmTBG/qjw==”
$absoluteUri = "https://md-mfqk4qz2wbbt.z16.blob.storage.azure.net/t1j0cx1s3xv5/abcd?sv=2018-03-28&sr=b&si=e6a152f6-3034-4c6b-9f85-01b14a807d3b&sig=cbQu200%2Bcix4Hxww6LhgsmbLqnuNDHjgCSrgJ8eG2%2F0%3D"
$destContainer = “mycon”
$blobName = “vmware_vm.vhd”
$destContext = New-AzStorageContext –StorageAccountName $storageAccountName -StorageAccountKey $storageAccountKey
Start-AzStorageBlobCopy -AbsoluteUri $absoluteUri -DestContainer $destContainer -DestContext $destContext -DestBlob $blobName