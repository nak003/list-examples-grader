rm -rf student-submission
mkdir student-submission
git clone $1 student-submission
cp TestListExamples.java student-submission
cd student-submission
GRADE=0 

if [[ -e ListExamples.java ]]
then 
    echo "ListExamples.java file submitted! +1 point"
    ((GRADE++))
else 
    echo "ListExamples.java file is missing -1 point Total:" $GRADE"/3 point"
    exit 1
fi
CPATH=".:../lib/hamcrest-core-1.3.jar:../lib/junit-4.13.2.jar"
javac -cp $CPATH *.java
if [[ $? -eq 0 ]]
then
    echo "Files are successfully complied! +1 point"
    ((GRADE++))
else 
    echo "Complie Error -1 point Total:" $GRADE"/3 point"
    exit 1
fi 

java -cp $CPATH org.junit.runner.JUnitCore TestListExamples
if [[ $? -eq 0 ]]
then
    ((GRADE++)) 
    echo "All test passed! Total:" $GRADE"/3 point"
    exit 0

else 
    echo "Test Error -1 point"
    echo "More work needed! Total:" $GRADE"/3 point"
    exit 1
fi 
