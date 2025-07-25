#!/bin/bash

# Step 1: Ensure we're in the repo root
if [ ! -d ".git" ]; then
  echo "Run this from the root of your Git repository."
  exit 1
fi

# Step 2: Create .binder/ if it doesn't exist
mkdir -p .binder

# Step 3: Write the binder config file to skip building
echo "image: mhuo27/deeptcr-binder:latest" > .binder/binder
echo "Created .binder/binder to point to your prebuilt Docker image."

# Step 4: Remove build-related files (optional but recommended)
rm -f .binder/requirements.txt .binder/environment.yml .binder/Dockerfile .binder/apt.txt .binder/postBuild .binder/start
echo "Removed any old build files in .binder/ that could trigger a build."

# Step 5: Stage the changes
git add .binder/binder
git rm -f .binder/requirements.txt .binder/environment.yml .binder/Dockerfile .binder/apt.txt .binder/postBuild .binder/start 2>/dev/null

# Step 6: Commit the changes
git commit -m "Switch Binder to use prebuilt Docker image"

echo " Ready to push. Run:"
echo "    git push origin main"
echo
echo "Then test it at:"
echo "    https://mybinder.org/v2/docker/mhuo27/deeptcr-binder/latest"
