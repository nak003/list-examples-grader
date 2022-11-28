# Create your grading script here
rm -rf student-submission
mkdir student-submission
git clone $1 student-submission
cp TestListExamples.java student-submission
cd student-submission

if [[ -e ListExamples.java ]]
then 
    echo "ListExamples.java file submitted! +1 point"
else 
    echo "ListExamples.java file is missing"
    exit 1
fi
CPATH=".:../lib/hamcrest-core-1.3.jar:../lib/junit-4.13.2.jar"
javac -cp $CPATH *.java
if [[ $? -eq 0 ]]
then
    echo "Files are successfully complied! +1 point"

else 
    echo "Complie Error"
    exit 1
fi 

java -cp $CPATH org.junit.runner.JUnitCore TestListExamples
if [[ $? -eq 0 ]]
then
    echo "All test passed! Total: 3/3 point"
    exit 0

else 
    echo "Test Error"
    exit 1
fi 
