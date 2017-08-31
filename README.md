# Docker.PowershellPlusGit

Docker script for a Linux image that contains both Powershell and Git.  Useful for running build steps in Jenkins.

# Building

```
docker build .
```

# Using in Jenkins

```Groovy
docker.image('centeredge/powershell.git:latest').inside() {
	sh "powershell -c ./scripts/AutoVersionNumber.ps1 > version"
}

version = readFile('version').trim()
echo "version=$version"
```