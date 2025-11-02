# GitHub Setup and Release Script for SEM Wallet
# This script helps you set up GitHub repository and create a release

Write-Host ""
Write-Host "╔════════════════════════════════════════════════════════════╗" -ForegroundColor Cyan
Write-Host "║       SEM WALLET - GITHUB REPOSITORY SETUP SCRIPT        ║" -ForegroundColor Cyan
Write-Host "╚════════════════════════════════════════════════════════════╝" -ForegroundColor Cyan
Write-Host ""

# Step 1: Get GitHub username
Write-Host "STEP 1: GitHub Username" -ForegroundColor Yellow
Write-Host "────────────────────────────────────────────────────────────" -ForegroundColor Gray
$username = Read-Host "Enter your GitHub username"

if ([string]::IsNullOrWhiteSpace($username)) {
    Write-Host "Error: Username cannot be empty!" -ForegroundColor Red
    exit 1
}

Write-Host "✓ Username set to: $username" -ForegroundColor Green
Write-Host ""

# Step 2: Confirm repository creation
Write-Host "STEP 2: Create GitHub Repository" -ForegroundColor Yellow
Write-Host "────────────────────────────────────────────────────────────" -ForegroundColor Gray
Write-Host "Please follow these steps:" -ForegroundColor White
Write-Host ""
Write-Host "1. Open this URL in your browser:" -ForegroundColor Cyan
Write-Host "   https://github.com/new" -ForegroundColor White
Write-Host ""
Write-Host "2. Fill in the form:" -ForegroundColor Cyan
Write-Host "   - Repository name: semwallet" -ForegroundColor White
Write-Host "   - Description: SEM Wallet - Download Center" -ForegroundColor White
Write-Host "   - Visibility: Public" -ForegroundColor White
Write-Host ""
Write-Host "3. Click 'Create repository'" -ForegroundColor Cyan
Write-Host ""

$confirm = Read-Host "Have you created the repository? (y/n)"
if ($confirm -ne "y" -and $confirm -ne "Y") {
    Write-Host "Please create the repository first, then run this script again." -ForegroundColor Yellow
    exit 0
}

Write-Host "✓ Repository confirmed" -ForegroundColor Green
Write-Host ""

# Step 3: Add remote and push
Write-Host "STEP 3: Pushing Code to GitHub" -ForegroundColor Yellow
Write-Host "────────────────────────────────────────────────────────────" -ForegroundColor Gray

$repoUrl = "https://github.com/$username/semwallet.git"
Write-Host "Adding remote: $repoUrl" -ForegroundColor Cyan

git remote add origin $repoUrl 2>$null
if ($LASTEXITCODE -ne 0) {
    Write-Host "Remote already exists, updating..." -ForegroundColor Yellow
    git remote set-url origin $repoUrl
}

Write-Host "Pushing code to GitHub..." -ForegroundColor Cyan
git add .
git commit -m "Initial commit: SEM Wallet download website" -q 2>$null
git push -u origin main

if ($LASTEXITCODE -ne 0) {
    Write-Host "Push failed. You may need to authenticate with GitHub." -ForegroundColor Red
    Write-Host "Try running: git push -u origin main" -ForegroundColor Yellow
    Write-Host ""
    Write-Host "If you need to authenticate, you may need to use a Personal Access Token." -ForegroundColor Yellow
    Write-Host "Create one at: https://github.com/settings/tokens" -ForegroundColor White
    exit 1
}

Write-Host "✓ Code pushed successfully" -ForegroundColor Green
Write-Host ""

# Step 4: Create Release
Write-Host "STEP 4: Create GitHub Release" -ForegroundColor Yellow
Write-Host "────────────────────────────────────────────────────────────" -ForegroundColor Gray
Write-Host "Now let's create a release and upload the APK file." -ForegroundColor White
Write-Host ""
Write-Host "1. Open this URL in your browser:" -ForegroundColor Cyan
Write-Host "   https://github.com/$username/semwallet/releases/new" -ForegroundColor White
Write-Host ""
Write-Host "2. Fill in the release form:" -ForegroundColor Cyan
Write-Host "   - Tag version: v1.0.0" -ForegroundColor White
Write-Host "   - Release title: SEM Wallet v1.0.0 - Initial Release" -ForegroundColor White
Write-Host "   - Description: (copy from below)" -ForegroundColor White
Write-Host ""
Write-Host "───────────────────────────────────────────────────────────" -ForegroundColor DarkGray
Write-Host "SEM Wallet - Your Gateway to Sovereign Financial Freedom" -ForegroundColor White
Write-Host ""
Write-Host "Features:" -ForegroundColor White
Write-Host "- Decentralized identity with 10-word recovery" -ForegroundColor White
Write-Host "- 6-digit passcode security layer" -ForegroundColor White
Write-Host "- African-origin innovation with local payment integration" -ForegroundColor White
Write-Host "- SEM Coin ecosystem integration" -ForegroundColor White
Write-Host "- Anti-manipulation & privacy protection" -ForegroundColor White
Write-Host "- Modern, simplified UI" -ForegroundColor White
Write-Host "───────────────────────────────────────────────────────────" -ForegroundColor DarkGray
Write-Host ""
Write-Host "3. Upload the APK file:" -ForegroundColor Cyan
Write-Host "   - Scroll down to 'Attach binaries'" -ForegroundColor White
Write-Host "   - Drag and drop: Semwallet.apk" -ForegroundColor White
Write-Host "   - OR click 'Choose files' and select it" -ForegroundColor White
Write-Host ""
Write-Host "4. Click 'Publish release'" -ForegroundColor Cyan
Write-Host ""

$confirm = Read-Host "Have you created the release and uploaded the APK? (y/n)"
if ($confirm -ne "y" -and $confirm -ne "Y") {
    Write-Host "Please create the release, then continue." -ForegroundColor Yellow
    exit 0
}

Write-Host "✓ Release created" -ForegroundColor Green
Write-Host ""

# Step 5: Update download link
Write-Host "STEP 5: Update Download Link" -ForegroundColor Yellow
Write-Host "────────────────────────────────────────────────────────────" -ForegroundColor Gray

$downloadUrl = "https://github.com/$username/semwallet/releases/download/v1.0.0/Semwallet.apk"

Write-Host "Updating script.js with download link..." -ForegroundColor Cyan

$scriptPath = "public\script.js"
$scriptContent = Get-Content $scriptPath -Raw
$scriptContent = $scriptContent -replace "const APK_DOWNLOAD_URL = '.*';", "const APK_DOWNLOAD_URL = '$downloadUrl';"
Set-Content -Path $scriptPath -Value $scriptContent

Write-Host "✓ Download link updated" -ForegroundColor Green
Write-Host ""

# Step 6: Redeploy
Write-Host "STEP 6: Redeploy Website" -ForegroundColor Yellow
Write-Host "────────────────────────────────────────────────────────────" -ForegroundColor Gray

$redeploy = Read-Host "Do you want to redeploy the website now? (y/n)"
if ($redeploy -eq "y" -or $redeploy -eq "Y") {
    Write-Host "Committing changes..." -ForegroundColor Cyan
    git add public/script.js
    git commit -m "Update APK download link"
    git push
    
    Write-Host "Deploying to Firebase..." -ForegroundColor Cyan
    firebase deploy --only hosting
    
    if ($LASTEXITCODE -eq 0) {
        Write-Host "✓ Website redeployed successfully" -ForegroundColor Green
    }
}

Write-Host ""
Write-Host "╔════════════════════════════════════════════════════════════╗" -ForegroundColor Green
Write-Host "║                    SETUP COMPLETE! 🎉                     ║" -ForegroundColor Green
Write-Host "╚════════════════════════════════════════════════════════════╝" -ForegroundColor Green
Write-Host ""
Write-Host "Your SEM Wallet download center is now live!" -ForegroundColor Cyan
Write-Host ""
Write-Host "📱 Website URLs:" -ForegroundColor Yellow
Write-Host "   • https://sem-wallet.web.app" -ForegroundColor White
Write-Host "   • https://sem-wallet.firebaseapp.com" -ForegroundColor White
Write-Host ""
Write-Host "🔗 GitHub Repository:" -ForegroundColor Yellow
Write-Host "   • https://github.com/$username/semwallet" -ForegroundColor White
Write-Host ""
Write-Host "📦 APK Download Link:" -ForegroundColor Yellow
Write-Host "   • $downloadUrl" -ForegroundColor White
Write-Host ""
Write-Host "Visit your website to test the download functionality!" -ForegroundColor Cyan
Write-Host ""

