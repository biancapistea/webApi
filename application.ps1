# Define the directory where you want to clone the application
$cloneDirectory = "C:\DotNetApp"
$iisDirectory = "C:\WebApiDeployed"

# Create the directory if it doesn't exist
if (-not (Test-Path -Path $cloneDirectory -PathType Container)) {
    New-Item -Path $cloneDirectory -ItemType Directory
}

# Create the directory if it doesn't exist
if (-not (Test-Path -Path $iisDirectory -PathType Container)) {
    New-Item -Path $iisDirectory -ItemType Directory
}

# Clone the application from GitHub
git clone https://github.com/biancapistea/webApi.git $cloneDirectory

# Navigate to the cloned directory
Set-Location $cloneDirectory

dotnet restore

# Build the application
dotnet build

Copy-Item -Path "$cloneDirectory\bin\Debug\net8.0\*" -Destination $iisDirectory -Recurse

New-WebSite -Name "webApi" -PhysicalPath $iisDirectory -Port 80 -HostHeader "localhost"

# Run the application
# dotnet run