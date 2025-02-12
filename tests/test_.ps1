# using Pester 3.x syntax
Describe "Test editor.ps1" {
    . ../editor.ps1
    Clear-Content ./.env
    It "key value get set" {
        Append ./.env any=bar
        $data = Get-Properties ./.env
        $data["any"] | Should Be bar
        Configure ./.env any foo
        $data = Get-Properties ./.env
        $data["any"] | Should Be foo
    }
    Clear-Content ./.env
}
Describe "error handle" {
    $ErrorActionPreference = "Stop"
    function Raise {
        throw "error"
    }
    
}

