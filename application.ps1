# Define the directory where you want to clone the application
$cloneDirectory = "C:\DotNetApp"

# Create the directory if it doesn't exist
if (-not (Test-Path -Path $cloneDirectory -PathType Container)) {
    New-Item -Path $cloneDirectory -ItemType Directory
}

# Clone the application from GitHub
git clone https://github.com/biancapistea/webApi.git $cloneDirectory

# Navigate to the cloned directory
Set-Location $cloneDirectory

# Build the application
dotnet build

# Run the application
# dotnet run