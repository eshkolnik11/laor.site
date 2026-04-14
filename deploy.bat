@echo off
echo ========================================
echo    Yuval Laor Site - Auto Deploy
echo ========================================
echo.

git --version >nul 2>&1
if errorlevel 1 (
    echo ERROR: Git is not installed!
    pause
    exit
)

echo Step 1: Setting up Git...
git init
git remote remove origin 2>nul
git remote add origin https://github.com/eshkolnik11/laor.site.git

echo.
echo Step 2: Uploading to GitHub...
git add .
git commit -m "deploy %date% %time%"
git branch -M main
git push -u origin main --force

echo.
echo ========================================
echo  Done! Vercel will update automatically.
echo ========================================
echo.
pause
