// SEM Wallet Download Center
// Direct download link - will be updated after GitHub release
const APK_DOWNLOAD_URL = 'https://github.com/USERNAME/semwallet/releases/download/v1.0.0/semwallet.apk';

function downloadApp() {
    const button = document.querySelector('.download-btn');
    
    // Add loading state
    button.classList.add('downloading');
    
    // Create a temporary link and trigger download
    const link = document.createElement('a');
    link.href = APK_DOWNLOAD_URL;
    link.download = 'semwallet.apk';
    document.body.appendChild(link);
    link.click();
    document.body.removeChild(link);
    
    // Remove loading state after a moment
    setTimeout(() => {
        button.classList.remove('downloading');
        showDownloadNotification();
    }, 1000);
}

function showDownloadNotification() {
    // Create notification element
    const notification = document.createElement('div');
    notification.style.cssText = `
        position: fixed;
        bottom: 30px;
        right: 30px;
        background: linear-gradient(135deg, #5B47ED, #2196F3, #00BCD4);
        color: white;
        padding: 20px 30px;
        border-radius: 12px;
        box-shadow: 0 10px 30px rgba(91, 71, 237, 0.4);
        font-weight: 600;
        z-index: 1000;
        animation: slideIn 0.3s ease;
    `;
    notification.textContent = '✓ Download started! Check your downloads folder.';
    
    // Add animation
    const style = document.createElement('style');
    style.textContent = `
        @keyframes slideIn {
            from {
                transform: translateX(400px);
                opacity: 0;
            }
            to {
                transform: translateX(0);
                opacity: 1;
            }
        }
        @keyframes slideOut {
            from {
                transform: translateX(0);
                opacity: 1;
            }
            to {
                transform: translateX(400px);
                opacity: 0;
            }
        }
    `;
    document.head.appendChild(style);
    
    document.body.appendChild(notification);
    
    // Remove notification after 3 seconds
    setTimeout(() => {
        notification.style.animation = 'slideOut 0.3s ease';
        setTimeout(() => {
            document.body.removeChild(notification);
        }, 300);
    }, 3000);
}

// Add smooth scroll behavior
document.documentElement.style.scrollBehavior = 'smooth';

