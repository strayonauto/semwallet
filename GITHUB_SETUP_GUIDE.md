# GitHub Repository Setup & APK Upload Guide

## Step 1: Create GitHub Repository

1. Go to: **https://github.com/new**
2. Fill in:
   - Repository name: `semwallet`
   - Description: "SEM Wallet - Download Center"
   - Make it **Public**
3. Click **"Create repository"**

## Step 2: Push Code to GitHub

Open PowerShell and run these commands:

```powershell
cd "C:\Users\abrha\sem wallet web"

# Add your GitHub repository (replace YOUR_USERNAME with your GitHub username)
git remote add origin https://github.com/YOUR_USERNAME/semwallet.git

# Push the code
git push -u origin main
```

## Step 3: Create GitHub Release & Upload APK

1. Go to: **https://github.com/YOUR_USERNAME/semwallet/releases/new**

2. Fill in the release form:
   - **Tag version**: `v1.0.0`
   - **Release title**: `SEM Wallet v1.0.0 - Initial Release`
   - **Description**: 
     ```
     SEM Wallet - Your Gateway to Sovereign Financial Freedom
     
     Features:
     - Decentralized identity with 10-word recovery
     - 6-digit passcode security layer
     - African-origin innovation with local payment integration
     - SEM Coin ecosystem integration
     - Anti-manipulation & privacy protection
     - Modern, simplified UI
     ```

3. **Upload the APK**:
   - Scroll down to "Attach binaries" section
   - Click "Choose files" or drag and drop
   - Select: `C:\Users\abrha\sem wallet web\Semwallet.apk`

4. Click **"Publish release"**

## Step 4: Get Direct Download Link

After publishing the release:

1. Your APK will appear in the Assets section
2. Right-click on `Semwallet.apk`
3. Select **"Copy link address"**
4. The link will be in this format:
   ```
   https://github.com/YOUR_USERNAME/semwallet/releases/download/v1.0.0/Semwallet.apk
   ```

## Step 5: Update Website Download Link

1. Open: `public/script.js`
2. Find line 2: `const APK_DOWNLOAD_URL = ...`
3. Replace `YOUR_GITHUB_USERNAME` with your actual username
4. Example:
   ```javascript
   const APK_DOWNLOAD_URL = 'https://github.com/abrha/semwallet/releases/download/v1.0.0/Semwallet.apk';
   ```

5. Save the file

## Step 6: Redeploy Website

```powershell
cd "C:\Users\abrha\sem wallet web"
git add public/script.js
git commit -m "Update APK download link"
git push
firebase deploy --only hosting
```

## Your Website URLs

After deployment, your website is live at:
- **Primary URL**: https://sem-wallet.web.app
- **Secondary URL**: https://sem-wallet.firebaseapp.com

## Quick Reference

**GitHub Repository**: https://github.com/YOUR_USERNAME/semwallet
**Firebase Console**: https://console.firebase.google.com/project/sem-wallet/overview
**Website**: https://sem-wallet.web.app

---

🎉 **Congratulations!** Your SEM Wallet download center is now live!

