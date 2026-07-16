#!/bin/bash
# ============================================================
#  Publish the UiPath PSE Support Assistant to GitHub Pages
#  Double-click this file in Finder to push your latest changes.
#
#  It (1) refreshes the embedded guides from your NEWEST exported
#  .skill package, then (2) commits and pushes. Live in ~1 min.
# ============================================================
set -e
cd "$(dirname "$0")"
export PATH="$HOME/.local/bin:$PATH"

echo "==============================================="
echo " Publishing UiPath PSE Support Assistant"
echo "==============================================="

echo "-> Syncing embedded guides from your latest skill export..."
python3 sync_from_skill.py

git add -A
git commit -m "Update $(date '+%Y-%m-%d %H:%M')" || echo "(nothing new to commit)"
echo "-> Pushing to GitHub..."
git push
echo ""
echo "Done! Any changes will be live in ~1 minute at:"
echo "  https://dinesh12nov.github.io/uipath-orchestrator-assistant/"

echo ""
echo "Press any key to close this window..."
read -n 1 -s
