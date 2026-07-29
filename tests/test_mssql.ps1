# using Pester 3.x syntax
Describe "Test mssql.ps1" {
    It "uses the command line utilities package with silent license acceptance" {
        . "$PSScriptRoot/../database/mssql.ps1"
        $command = Get-Command Download-BCP
        $command.ScriptBlock.ToString() | Should -Match '2370127'
        (Get-Command Install-BCP).ScriptBlock.ToString() | Should -Match 'IACCEPTMSSQLCMDLNUTILSLICENSETERMS=YES'
    }
}
