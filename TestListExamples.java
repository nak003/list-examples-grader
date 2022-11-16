import static org.junit.Assert.*;
import org.junit.*;
import java.util.*; 

class Checker implements StringChecker{
  public boolean checkString(String s){
    return s.contains("app");
  }
}

public class TestListExamples {
  @Test
    public void testMerge(){
        List<String> list1 = new ArrayList<String>();
        list1.add("x");
        list1.add("y");
        List<String> list2 = new ArrayList<String>();
        list2.add("a");
        list2.add("z"); 
        List<String> expected = new ArrayList<String>();
        expected.add("a");
        expected.add("x");
        expected.add("y");
        expected.add("z");
        assertEquals(expected, ListExamples.merge(list1, list2));
  }

  @Test
    public void testFilter(){
        List<String> list1 = new ArrayList<String>();
        list1.add("apple"); 
        list1.add("none");
        list1.add("pineapple");
        list1.add("hi");
        list1.add("app");
        List<String> expected = new ArrayList<String>();
        expected.add("apple");
        expected.add("pineapple");
        expected.add("app");
        StringChecker sc = new Checker();
        assertEquals(expected, ListExamples.filter(list1, sc));
  }
}
