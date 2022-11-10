# Create your grading script here

set -e

rm -rf student-submission

git clone $1 student-submission

cd student-submission

if [[ -f ListExamples.java ]]
then 
    echo "ListExamples.java file submitted"
else 
    echo "ListExamples.java file not submitted"
    exit 1
fi


cp ListExamples.java ../
cd ../

javac -cp .:lib/hamcrest-core-1.3.jar:lib/junit-4.13.2.jar *.java 
java -cp .:lib/hamcrest-core-1.3.jar:lib/junit-4.13.2.jar org.junit.runner.JUnitCore TestListExamples
