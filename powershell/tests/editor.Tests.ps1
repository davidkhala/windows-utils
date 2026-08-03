# using Pester 5+ syntax
Describe "Test editor.ps1" {
    BeforeAll {
        $envFile = Join-Path $PSScriptRoot ".env"
        . (Join-Path $PSScriptRoot "..\editor.ps1")
    }

    BeforeEach {
        Clear-Content $envFile
    }

    It "key value get set" {
        Append $envFile any=bar
        $data = Get-Properties $envFile
        $data["any"] | Should -Be "bar"
        Configure $envFile any foo
        $data = Get-Properties $envFile
        $data["any"] | Should -Be "foo"
    }

    AfterAll {
        Clear-Content $envFile
    }
}
Describe "error handle" {
    It "ErrorActionPreference Stop makes Write-Error terminating" {
        $oldPreference = $ErrorActionPreference
        try {
            $ErrorActionPreference = "Stop"
            { Write-Error "error" } | Should -Throw
        }
        finally {
            $ErrorActionPreference = $oldPreference
        }
    }
}

