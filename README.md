# SEM Wallet - Download Center

A modern, futuristic download center for SEM Wallet built with pure HTML, CSS, and JavaScript.

## Features

- 🎨 Modern gradient UI matching SEM Wallet branding
- 📱 Direct APK download functionality
- 🌐 Responsive design optimized for desktop
- ⚡ Fast, lightweight, and production-ready
- 🔥 Deployed on Firebase Hosting

## Deployment Instructions

### Step 1: Install Firebase CLI

```bash
npm install -g firebase-tools
```

### Step 2: Login to Firebase

```bash
firebase login
```

### Step 3: Initialize Firebase Project

```bash
firebase init hosting
```

Select:
- Use an existing project or create a new one named "semwallet"
- Public directory: `public`
- Configure as single-page app: `Yes`
- Set up automatic builds: `No`

### Step 4: Deploy to Firebase

```bash
firebase deploy
```

Your site will be live at: `https://semwallet.web.app`

## Setting Up GitHub Release for APK

### Step 1: Create GitHub Repository

```bash
git init
git add .
git commit -m "Initial commit"
gh repo create semwallet --public --source=. --remote=origin --push
```

### Step 2: Create a Release and Upload APK

1. Copy your `semwallet.apk` file to this directory
2. Run these commands:

```bash
# Create a new release
gh release create v1.0.0 semwallet.apk --title "SEM Wallet v1.0.0" --notes "Initial release of SEM Wallet"
```

### Step 3: Get Direct Download Link

After creating the release, get the direct download link:

```bash
gh release view v1.0.0
```

The direct download link will be in this format:
```
https://github.com/YOUR_USERNAME/semwallet/releases/download/v1.0.0/semwallet.apk
```

### Step 4: Update Download Link

Edit `public/app.js` and replace the `APK_DOWNLOAD_URL` with your actual GitHub direct download link.

```javascript
const APK_DOWNLOAD_URL = 'https://github.com/YOUR_USERNAME/semwallet/releases/download/v1.0.0/semwallet.apk';
```

### Step 5: Redeploy

```bash
firebase deploy
```

## What Makes SEM Wallet Different?

- 💠 **Decentralized Identity**: True ownership with email login, 10 secret recovery words, and 6-digit passcode
- ⚙️ **Next-Gen Web3**: Bridge between users, finance, and future Web3 ecosystems
- 💸 **African Innovation**: Built for Africa with Telebirr integration and local payment support
- 🪙 **SEM Coin Ecosystem**: Native platform for SEM digital currency
- 🔒 **Privacy Protection**: End-to-end encryption with no centralized tracking
- 🎨 **Modern UI**: Minimal, futuristic interface optimized for new crypto users

## License

© 2025 SEM Wallet. All rights reserved.

