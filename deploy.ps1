# SEM Wallet Deployment Script
Write-Host "=================================" -ForegroundColor Cyan
Write-Host "  SEM WALLET DEPLOYMENT SCRIPT  " -ForegroundColor Cyan
Write-Host "=================================" -ForegroundColor Cyan
Write-Host ""

# Check if Firebase is logged in
Write-Host "Checking Firebase authentication..." -ForegroundColor Yellow
firebase projects:list | Out-Null
if ($LASTEXITCODE -ne 0) {
    Write-Host "Please login to Firebase first: firebase login" -ForegroundColor Red
    exit 1
}

Write-Host "✓ Firebase authenticated" -ForegroundColor Green
Write-Host ""

# Deploy to Firebase
Write-Host "Deploying to Firebase Hosting..." -ForegroundColor Yellow
firebase deploy --only hosting

if ($LASTEXITCODE -eq 0) {
    Write-Host ""
    Write-Host "=================================" -ForegroundColor Green
    Write-Host "  DEPLOYMENT SUCCESSFUL!  " -ForegroundColor Green
    Write-Host "=================================" -ForegroundColor Green
    Write-Host ""
    Write-Host "Your website is now live at:" -ForegroundColor Cyan
    Write-Host "https://semwallet-web.web.app" -ForegroundColor White
    Write-Host "https://semwallet-web.firebaseapp.com" -ForegroundColor White
    Write-Host ""
    Write-Host "Next steps:" -ForegroundColor Yellow
    Write-Host "1. Create GitHub repository at https://github.com/new" -ForegroundColor White
    Write-Host "2. Name it: semwallet" -ForegroundColor White
    Write-Host "3. Run: git remote add origin https://github.com/YOUR_USERNAME/semwallet.git" -ForegroundColor White
    Write-Host "4. Run: git push -u origin main" -ForegroundColor White
    Write-Host "5. Create a Release and upload Semwallet.apk" -ForegroundColor White
    Write-Host "6. Update public/script.js with the direct download link" -ForegroundColor White
    Write-Host ""
} else {
    Write-Host "Deployment failed!" -ForegroundColor Red
    exit 1
}

