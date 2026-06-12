<#
.SYNOPSIS
    Sanitized quality gate example.

.DESCRIPTION
    This script demonstrates the style of a validation step used before release.
    It does not execute any production command.
#>

$ErrorActionPreference = "Stop"

function Invoke-ShowcaseStep {
    param(
        [Parameter(Mandatory = $true)]
        [string] $Name,

        [Parameter(Mandatory = $true)]
        [scriptblock] $Action
    )

    Write-Host "==> $Name"

    try {
        & $Action
        Write-Host "OK  $Name"
    }
    catch {
        Write-Host "FAIL $Name"
        throw
    }
}

Invoke-ShowcaseStep -Name "Validate documentation structure" -Action {
    $requiredPaths = @(
        "README.md",
        "docs/architecture.md",
        "docs/modules.md",
        "docs/quality-gates.md"
    )

    foreach ($path in $requiredPaths) {
        if (-not (Test-Path $path)) {
            throw "Required file not found: $path"
        }
    }
}

Invoke-ShowcaseStep -Name "Validate sanitized sample policy" -Action {
    $forbiddenTerms = @(
        "password=",
        "connectionstring",
        "secret",
        "token="
    )

    $files = Get-ChildItem -Path . -Recurse -File -Include *.md,*.cs,*.ps1,*.sql

    foreach ($file in $files) {
        $content = Get-Content $file.FullName -Raw
        foreach ($term in $forbiddenTerms) {
            if ($content.ToLowerInvariant().Contains($term)) {
                throw "Potential sensitive term found in $($file.FullName): $term"
            }
        }
    }
}
