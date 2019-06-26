# How to Release Pod to github

## SOP

### 1. Modify Podspec accordingly

### 2. Check validation.
```
pod lib lint gvhelper.podspec
```
- fixed ERROR and WARNING accordingly.

### 3. Push to Github 

### 4. Release Tab on Github
- Github->Release->create release->match version.

### 5. Trunk
```
pod trunk register [Email] [name]
pod trunk push gvhelper.podspec
```
