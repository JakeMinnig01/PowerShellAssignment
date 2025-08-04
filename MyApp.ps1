<#
    Script Name: MyApp.ps1
    Author: Jake Minnig
    Purpose: Read a comma-separated file and output sorted numeric, alphabetic, or both types of values
    Usage: .\MyApp.ps1 "<path-to-file>" "numeric|alpha|both" "ascending|descending"
#>

param (
    [string]$FilePath,
    [string]$ValueType,
    [string]$SortOrder
)

# --- Input Validation ---

# Check that the file exists
if (!(Test-Path $FilePath)) {
    Write-Error "The file path '$FilePath' does not exist."
    exit
}

# Define valid inputs
$validTypes = @("numeric", "alpha", "both")
$validSorts = @("ascending", "descending")

# Validate the value type parameter
if ($ValueType.ToLower() -notin $validTypes) {
    Write-Error "Invalid value type: $ValueType. Use 'numeric', 'alpha', or 'both'."
    exit
}

# Validate the sort order parameter
if ($SortOrder.ToLower() -notin $validSorts) {
    Write-Error "Invalid sort order: $SortOrder. Use 'ascending' or 'descending'."
    exit
}

# --- Read and Parse File ---

$content = Get-Content $FilePath

# Check for empty file
if ([string]::IsNullOrWhiteSpace($content)) {
    Write-Error "The file '$FilePath' is empty."
    exit
}

$values = ($content -split ",") | ForEach-Object { $_.Trim() }

# --- Categorize Values ---
$numericValues = @()
$alphaValues = @()

foreach ($val in $values) {
    if ($val -match '^[\d.]+$') {
        $numericValues += [double]$val
    }
    elseif ($val -match '^[a-zA-Z]+$') {
        $alphaValues += $val
    }
}

# --- Select Value Type ---
switch ($ValueType.ToLower()) {
    "numeric" { $final = $numericValues }
    "alpha"   { $final = $alphaValues }
    "both"    { $final = $numericValues + $alphaValues }
}

# --- Sort Values ---
switch ($SortOrder.ToLower()) {
    "ascending"  { $final = $final | Sort-Object }
    "descending" { $final = $final | Sort-Object -Descending }
}

# --- Output Result ---
Write-Output ($final -join ",")

