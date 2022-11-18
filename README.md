## Usage

`./automate.sh [JAVA|java] [foldername] [ARTIFACT_ID]`

`./automate.sh [RUBY|ruby] [foldername] [YourGemName]`

It's recommended you put an alias in your `.zshrc` or `.zprofile`

```
alias generate='sh path/to/repo/automate.sh'
```
then use it
```
generate java folder yourpreferredname
```

## Example Usage

### Java

```
automate java calculate-distance-john-java distancecalculator
```
or
```
automate java calculate-distance-john-java DistanceCalculator
```
It's gonna rename `ARTIFACT_ID` to `distancecalculator`

### Ruby

```
automate ruby calculate-distance-john-ruby DistanceCalculator
```

It will rename `mygem` folders and files to `distancecalculator`

It will rename `Mygem` in the ruby codes to `DistanceCalculator`

That's why we pass it as PascalCase

## Requirements

- brew
- maven
