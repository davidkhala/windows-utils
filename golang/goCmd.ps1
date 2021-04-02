## Win shadow of https://github.com/davidkhala/go-utils/blob/master/scripts/goCmd.sh
function _clone {
    param (
        [Parameter(Position = 0, Mandatory)]
        [string]$reposURL,
        [Parameter(Position = 1, Mandatory)]
        [string]$orgName,
        [Parameter(Position = 2, Mandatory)]
        [string]$projectName,
        [Parameter(Position = 3)]
        [string]$branch
    )
    
    $GOPATH = $(go env GOPATH)
    $orgPath = "${GOPATH}\src\github.com\${orgName}"
    mkdir $orgPath -ea 0
    cd $orgPath
    if (!$(Test-Path -Path "${orgPath}\${projectName}" -PathType Container)) {
        git clone $reposURL
    }
    cd ${orgPath}/${projectName}
    git pull
    if ($branch) {
        git checkout $branch
    }
    echo "${orgPath}\${projectName}"
    cd -
    cd -
}
function Get-GO-Repos {
    param (
        [Parameter(Position = 0, Mandatory)]
        [string]$reposURL,
        [Parameter(Position = 1)]
        [string]$branch
    )
	
    try {
        if ($reposURL -match '^github') {
            Get-GO-Repos "https://${reposURL}.git" $branch
        }
        elseif ($reposURL -match '^https://') {
            $orgName = $reposURL.Split('/')[3]
            $projectName = $reposURL.Split('/')[4].Split('.')[0]
        
            _clone $reposURL $orgName $projectName $branch
        }
    }
    catch {
        $_
    }
}
function Remove-Go-Repos {
    param (
        [Parameter(Position = 0, Mandatory)]
        [string]$reposURL
    )
    
    try {
        if ($reposURL -match '^github') {
            Remove-GO-Repos "https://${reposURL}.git"
        }
        elseif ($reposURL -match '^https://') {
            $GOPATH = $(go env GOPATH)
            $orgName = $reposURL.Split('/')[3]
            $orgPath = "${GOPATH}\src\github.com\${orgName}"
            $projectName = $reposURL.Split('/')[4].Split('.')[0]
            Remove-Item -Recurse -Force ${orgPath}\${projectName}
        }
    }
    catch {
        $_
    }
    
}
# TODO WIP
function Install-Go-Repos {
    # Get & Ensure
    param (
        [Parameter(Position = 0, Mandatory)]
        [string]$reposURL,
        [Parameter(Position = 1)]
        [string]$branch
    )
    try {
        Get-GO-Repos $reposURL $branch
    }
    catch {
        $_
    }
    

    
}