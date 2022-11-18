#!/bin/sh

export LC_CTYPE=C 
export LANG=C

RED='\033[0;31m'

java=`echo $1 | grep -i "Java" | wc -l`
ruby=`echo $1 | grep -i "Ruby" | wc -l`

# JAVA

if [[ $java -eq 1 ]]
then
echo "Cloning Java..."
git clone https://source.golabs.io/gtf-bootcamp-03/template-java.git $2
cd $2

lowercased_artifact=$(echo $3 | tr '[:upper:]' '[:lower:]')

find . -type f -name '*' -exec sed -i '' "s/ARTIFACT_ID/$lowercased_artifact/g" {} +
rm src/main/java/project/ARTIFACT_ID/App.java src/test/java/project/ARTIFACT_ID/AppTest.java
mv src/main/java/project/ARTIFACT_ID src/main/java/project/$lowercased_artifact
mv src/test/java/project/ARTIFACT_ID src/test/java/project/$lowercased_artifact

mvn clean install

# END JAVA

# RUBY

elif [[ $ruby -eq 1 ]]
then
echo "Cloning Ruby..."
git clone https://source.golabs.io/gtf-bootcamp-03/template-ruby.git $2

cd $2

git_name=$(git config user.name)
git_email=$(git config user.email)

sed -i '' "s/John Doe/$git_name/" mygem.gemspec
sed -i '' "s/john.doe@gmail.com/$git_email/" mygem.gemspec

lowercased_gemname=$(echo $3 | tr '[:upper:]' '[:lower:]')
mv mygem.gemspec $lowercased_gemname.gemspec
mv lib/mygem.rb lib/$lowercased_gemname.rb
mkdir -p lib/$lowercased_gemname
mv lib/mygem/version.rb lib/$lowercased_gemname/version.rb

find . -type f -name '*' -exec sed -i '' "s/Mygem/$3/g" {} +
find . -type f -name '*' -exec sed -i '' "s/mygem/$lowercased_gemname/g" {} +
rmdir lib/mygem

bundle install

# END RUBY

else
echo "\n${RED}!!Bad Option!!${RED}\n"
echo "Usage: The Script takes in args as mentioned below\n"
echo "sh automate.sh JAVA [foldername] [ARTIFACT_ID]\n"
echo "sh automate.sh RUBY [foldername] [YourGemName]"
exit 0 
fi

git init

precommit=`pre-commit --version || brew install pre-commit`
pre-commit install
