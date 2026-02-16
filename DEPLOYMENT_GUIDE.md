# SwatiGreens Website - Hostinger Deployment Guide

## 📁 Files Ready for Deployment

Your production build is ready in the `build` folder with these files:
- `index.html` - Main HTML file
- `assets/` folder - Contains all CSS, JS, and image files
- `.htaccess` - Server configuration file (added for proper routing)

## 🚀 How to Deploy to Hostinger

### Method 1: Using Hostinger File Manager (Recommended)

1. **Login to Hostinger**
   - Go to [Hostinger Control Panel](https://www.hostinger.com/)
   - Login with your credentials

2. **Access File Manager**
   - Go to "Files" → "File Manager"
   - Navigate to your domain's `public_html` folder

3. **Upload Files**
   - Delete any existing files in `public_html` (if this is a fresh install)
   - Upload ALL contents from your `build` folder to `public_html`:
     - `index.html`
     - `assets/` folder (with all its contents)
     - `.htaccess` file

4. **Set Permissions**
   - Make sure `.htaccess` file has 644 permissions
   - Assets folder should have 755 permissions

### Method 2: Using FTP Client (Alternative)

1. **Get FTP Credentials**
   - In Hostinger panel, go to "Files" → "FTP Accounts"
   - Use the main FTP account or create a new one

2. **Connect via FTP**
   - Use FileZilla, WinSCP, or any FTP client
   - Connect using your FTP credentials

3. **Upload Files**
   - Navigate to `public_html` folder
   - Upload all contents from your `build` folder

## 🔧 Important Configuration

### Domain Setup
- If using a subdomain, upload to the subdomain's folder
- If using main domain, upload to `public_html`

### SSL Certificate
- Enable SSL in Hostinger panel for HTTPS
- Go to "SSL" section and activate it

### Custom Domain (if needed)
- Point your domain to Hostinger nameservers:
  - ns1.dns-parking.com
  - ns2.dns-parking.com

## 📊 Website Features
✅ Responsive design
✅ React components
✅ Tailwind CSS styling
✅ Image optimization
✅ SEO meta tags
✅ Email signup modal
✅ Blog functionality
✅ Contact forms

## 🛠️ Post-Deployment Checklist

1. **Test the website**
   - Visit your domain
   - Check all pages and sections
   - Test contact forms
   - Verify images load properly

2. **Performance Check**
   - Test loading speed
   - Check mobile responsiveness
   - Verify all links work

3. **SEO Setup**
   - Submit sitemap to Google Search Console
   - Set up Google Analytics (if needed)

## 🚨 Troubleshooting

### Common Issues:

**404 Errors on page refresh:**
- Make sure `.htaccess` file is uploaded and has correct permissions

**Images not loading:**
- Check that the `assets` folder uploaded completely
- Verify file permissions (755 for folders, 644 for files)

**CSS/JS not working:**
- Clear browser cache
- Check if all files in `assets` folder uploaded properly

**Contact forms not working:**
- Set up server-side handling for forms (PHP scripts)
- Configure email settings in Hostinger panel

## 📞 Support

If you encounter issues:
1. Check Hostinger documentation
2. Contact Hostinger support
3. Verify all files uploaded correctly

---

## Quick Upload Commands (For your reference)

Your files to upload from `build` folder:
```
📁 public_html/
├── index.html
├── .htaccess
└── 📁 assets/
    ├── [CSS files]
    ├── [JS files]
    └── [Image files]
```

**🎉 Your SwatiGreens website is ready for deployment!**