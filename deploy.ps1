# SwatiGreens Website Deployment Script
Write-Host "🚀 Building SwatiGreens Website for Deployment..." -ForegroundColor Green

# Build the project
Write-Host "📦 Building production files..." -ForegroundColor Yellow
npm run build

# Check if build was successful
if ($LASTEXITCODE -eq 0) {
    Write-Host "✅ Build completed successfully!" -ForegroundColor Green
    
    # Add .htaccess if not exists
    $htaccessPath = "build\.htaccess"
    if (-not (Test-Path $htaccessPath)) {
        Write-Host "📝 Adding .htaccess file..." -ForegroundColor Yellow
        @"
RewriteEngine On
RewriteRule ^(.*)$ /index.html [QSA,L]

# Enable compression
<IfModule mod_deflate.c>
    AddOutputFilterByType DEFLATE text/plain
    AddOutputFilterByType DEFLATE text/html
    AddOutputFilterByType DEFLATE text/xml
    AddOutputFilterByType DEFLATE text/css
    AddOutputFilterByType DEFLATE application/xml
    AddOutputFilterByType DEFLATE application/xhtml+xml
    AddOutputFilterByType DEFLATE application/rss+xml
    AddOutputFilterByType DEFLATE application/javascript
    AddOutputFilterByType DEFLATE application/x-javascript
</IfModule>

# Browser caching
<IfModule mod_expires.c>
    ExpiresActive on
    ExpiresByType text/css "access plus 1 year"
    ExpiresByType application/javascript "access plus 1 year"
    ExpiresByType image/png "access plus 1 year"
    ExpiresByType image/jpg "access plus 1 year"
    ExpiresByType image/jpeg "access plus 1 year"
    ExpiresByType image/gif "access plus 1 year"
    ExpiresByType image/svg+xml "access plus 1 year"
</IfModule>
"@ | Out-File -FilePath $htaccessPath -Encoding UTF8
    }
    
    # Show deployment info
    Write-Host ""
    Write-Host "🎉 Your website is ready for deployment!" -ForegroundColor Green
    Write-Host ""
    Write-Host "📁 Files to upload to Hostinger:" -ForegroundColor Cyan
    Write-Host "   • Upload ALL contents from 'build' folder to 'public_html'" -ForegroundColor White
    Write-Host "   • Make sure .htaccess file is included" -ForegroundColor White
    Write-Host ""
    Write-Host "📋 Deployment Steps:" -ForegroundColor Cyan
    Write-Host "   1. Login to Hostinger Control Panel" -ForegroundColor White
    Write-Host "   2. Go to Files → File Manager" -ForegroundColor White
    Write-Host "   3. Navigate to public_html folder" -ForegroundColor White
    Write-Host "   4. Upload all files from 'build' folder" -ForegroundColor White
    Write-Host "   5. Set proper permissions (.htaccess = 644, folders = 755)" -ForegroundColor White
    Write-Host ""
    Write-Host "📖 Read DEPLOYMENT_GUIDE.md for detailed instructions" -ForegroundColor Yellow
    
    # List build contents
    Write-Host ""
    Write-Host "📦 Build Contents:" -ForegroundColor Cyan
    Get-ChildItem -Path "build" -Recurse | ForEach-Object {
        $relativePath = $_.FullName.Replace((Get-Location).Path + "\build\", "")
        if ($_.PSIsContainer) {
            Write-Host "   📁 $relativePath" -ForegroundColor Blue
        } else {
            $sizeKB = [math]::Round($_.Length / 1KB, 2)
            Write-Host "   📄 $relativePath ($sizeKB KB)" -ForegroundColor White
        }
    }
    
} else {
    Write-Host "❌ Build failed! Please check for errors." -ForegroundColor Red
}

Write-Host ""
Write-Host "🌐 Your SwatiGreens website is ready to go live!" -ForegroundColor Green