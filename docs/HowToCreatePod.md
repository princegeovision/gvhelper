# How to create Pod
- for reuse source code.

## SOP
* 1). create a Pod



### Step1 : Create a Pod
```
pod lib create gvhelper
```
- iOS, Swift, yes, None, No

### Step2 : remove warning
- test project, Build setting, Framework Search Paths, delete "$(SDKROOT)/Developer/Library/Frameworks"

### Step3 : remove simulator issue
- [Project]->Scheme->Edit Scheme->Run->Arguments(Tab)->environment variable:
- add the following : Name:OS_ACTIVITY_MODE, Value: disable


