// Interface for roles  according to A
abstract class Role {
  void displayRole();
}

class Person implements Role {
  String name;
  int age;
  String address;

  Person(this.name, this.age, this.address);

  String getName() => name;
  int getAge() => age;
  String getAddress() => address;

  @override
  void displayRole() {
    print("Role: Person");
  }
}

class Student extends Person {
  String studentID;
  int grade;
  List<double> courseScores = [];

  Student(String name, int age, String address, this.studentID, this.grade)
      : super(name, age, address);

  double getAverageScore() {

    if (courseScores.isEmpty) {
      return 0.0;
    }
    double totalScore = 0.0;
    for (double score in courseScores) {
      totalScore += score;
    }

    double averageScore = totalScore / courseScores.length;

    return averageScore;
  }

  @override
  void displayRole() {
    super.displayRole();
    print("Student ID: $studentID");
    print("Grade: $grade");
    print("Average Score: ${getAverageScore()}");
  }
}

class Teacher extends Person {
  String teacherID;
  List<String> coursesTaught = [];

  Teacher(String name, int age, String address, this.teacherID)
      : super(name, age, address);

  void addCourseTaught(String courseName) {
    coursesTaught.add(courseName);
  }

  @override
  void displayRole() {
    super.displayRole();
    print("Teacher ID: $teacherID");
    print("Courses Taught:");
    coursesTaught.forEach((course) => print("- $course"));
  }
}

void main() {

  Student nahidul = Student("Nahidul", 20, "Mirpur", "STD123", 12);
  nahidul.courseScores = [90, 85, 82];
  Teacher rabbil = Teacher("Rabbil", 35, "456 Oak St", "TEA456");
  rabbil.addCourseTaught("Math");
  rabbil.addCourseTaught("English");
  rabbil.addCourseTaught("Bangla");

  print("Student Information:");
  nahidul.displayRole();

  print("\nTeacher Information:");
  rabbil.displayRole();
}
